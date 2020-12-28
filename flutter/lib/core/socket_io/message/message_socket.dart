import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:soket_io/core/helper/track_context.dart';
import 'package:soket_io/features/home/bloc/home_bloc.dart';
import 'package:soket_io/injection_container.dart';

mixin MessageSocket {
  final IO.Socket socket = null;

  void startMessageListening() {
    socket.on(
      'message',
      (data) {
        BlocProvider.of<HomeBloc>(sl<TrackContext>().getCurrentContext()).add(
          HomeRecieveMessageEvent(message: data),
        );
      },
    );
  }

  void sendMessage({@required String message}) {
    socket.emit('send', message);
  }
}
