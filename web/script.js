window.addEventListener("message", (event) => {
    var data = event.data;

    if (data.type === "position") {
        let hudPosition = document.getElementById("hud");

        document.getElementById("heading-output").textContent = data.heading;
        document.getElementById("pos-x-output").textContent = data.x;
        document.getElementById("pos-y-output").textContent = data.y;
        document.getElementById("pos-z-output").textContent = data.z;

        if (data.hudPosition) {
            if (data.hudPosition === "top-left") {
                hudPosition.style.top = "0";
                hudPosition.style.left = "0";
            } else if (data.hudPosition === "top-right") {
                hudPosition.style.top = "0";
                hudPosition.style.right = "0";
            } else if (data.hudPosition === "bottom-left") {
                hudPosition.style.bottom = "0";
                hudPosition.style.left = "0";
            } else if (data.hudPosition === "bottom-right") {
                hudPosition.style.bottom = "0";
                hudPosition.style.right = "0";
            } else if (data.hudPosition === "top-middle") {
                hudPosition.style.top = "0";
                hudPosition.style.left = "50%";
                hudPosition.style.transform = "translateX(-50%)";
            } else {
                hudPosition.style.top = "0";
                hudPosition.style.left = "0";
            }
        }
    }

    if (data.state) {
        document.body.style.display = "block";
    } else {
        document.body.style.display = "none";
    }
});

document.addEventListener("DOMContentLoaded", () => {
    document
        .getElementById("destination-cancel")
        .addEventListener("click", () => {
            axios.post(`https://${GetParentResourceName()}/releaseFocus`, {});
        });

    document
        .getElementById("destination-teleport")
        .addEventListener("click", () => {
            let x = document.getElementById("destination-x").value;
            let y = document.getElementById("destination-y").value;
            let z = document.getElementById("destination-z").value;

            if (x === "" || y === "" || z === "") {
                axios.post(`https://${GetParentResourceName()}/releaseFocus`, {
                    error: "Please enter a valid destination.",
                });
            } else {
                axios.post(`https://${GetParentResourceName()}/teleport`, {
                    x: x,
                    y: y,
                    z: z,
                });
            }
        });
});
