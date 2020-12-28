import 'package:soket_io/core/socket_io/socket_io.dart';
import 'package:soket_io/features/home/bloc/repo/home_model.dart';
import 'package:soket_io/injection_container.dart';

class HomeRepo {
  final List<HomeModel> messages = [];

  void sendMessage(String message) {
    sl<SocketIo>().sendMessage(message: message);
    messages
        .add(HomeModel(message: message, messageOwner: MessageOwner.SENDER));
  }

  void messageRecieved(String message) {
    messages
        .add(HomeModel(message: message, messageOwner: MessageOwner.RECIEVER));
  }
}
