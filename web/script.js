window.addEventListener("message", (event) => {
    var data = event.data;

    if (data.type === "position") {
        document.getElementById("heading-output").textContent = data.heading;
        document.getElementById("pos-x-output").textContent = data.x;
        document.getElementById("pos-y-output").textContent = data.y;
        document.getElementById("pos-z-output").textContent = data.z;
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
