const path = require("path");
const express = require("express");
const http = require("http");
const socketio = require("socket.io");

const app = express();
const server = http.createServer(app);
const io = socketio(server);

const port = 3000;
const publicDirectory = path.join(__dirname, "../public");

app.use(express.static(publicDirectory));

io.on("connection", (socket) => {
  console.log("User Joined");
  socket.on("send", (message) => {
    socket.broadcast.emit("message", message);
  });
});

server.listen(port, () => {
  console.log(`Server is up on ${port}`);
});
