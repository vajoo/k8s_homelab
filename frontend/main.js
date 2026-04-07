document.addEventListener("DOMContentLoaded", () => {
    fetch("/api")
    .then(response => response.json())
    .then(data => {
        document.getElementById("hostname").textContent = data.hostname;
    })
    .catch(error => {
        console.error("Error:", error);
    });
});