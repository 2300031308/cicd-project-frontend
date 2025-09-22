// src/config.js

// Detect if running inside Docker or from host browser
// If hostname is "localhost" -> assume browser on host
// Else -> assume frontend container inside Docker network
const isDocker = window.location.hostname !== "localhost";

const config = {
  // Backend URL dynamically chosen
  url: isDocker ? "http://backend:8081" : "http://localhost:8081"
};

export default config;
