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
            axios.post(`https://${GetParentResourceName()}/teleport`, {
                x: document.getElementById("destination-x").value,
                y: document.getElementById("destination-y").value,
                z: document.getElementById("destination-z").value,
            });
        });
});
