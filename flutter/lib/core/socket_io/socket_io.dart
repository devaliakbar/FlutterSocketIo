import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:soket_io/core/socket_io/message/message_socket.dart';

class SocketIo with MessageSocket {
  @override
  final IO.Socket socket = IO.io(
      'http://192.168.0.103:3000',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build());

  SocketIo({bool connectNow = true}) {
    if (connectNow) socket.connect();

    socket.onConnect((_) {
      print('Socket Connected');
    });
  }

  void disConnectSocket() {
    socket.disconnect();
  }

  void connectSocket() {
    socket.connect();
  }
}
