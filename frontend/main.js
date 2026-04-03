document.addEventListener("DOMContentLoaded", () => {
    fetch("http://localhost:8000")
    .then(response => response.json())
    .then(data => {
        document.getElementById("hostname").textContent = data.hostname;
    })
    .catch(error => {
        console.error("Error:", error);
    });
});