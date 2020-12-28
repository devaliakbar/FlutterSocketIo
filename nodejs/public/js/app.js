const socket = io();

socket.on("message", (message) => {
  jQuery(".recieved-table").append(" <tr><td>" + message + "</td></tr>");
});

const send = () => {
  var msg = $("#msg").val();

  if (msg == "") return;

  $("#msg").val("");

  jQuery(".send-table").append(" <tr><td>" + msg + "</td></tr>");

  socket.emit("send", msg);
};
