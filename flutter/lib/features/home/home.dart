import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soket_io/core/socket_io/socket_io.dart';
import 'package:soket_io/core/widgets/normal_text.dart';
import 'package:soket_io/features/home/bloc/home_bloc.dart';
import 'package:soket_io/features/home/bloc/repo/home_model.dart';
import 'package:soket_io/injection_container.dart';

class Home extends StatelessWidget {
  final TextEditingController _textEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    sl<SocketIo>().startMessageListening();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            print("Home State Changed");
          },
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: _textEditingController,
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    if (_textEditingController.text == "") {
                      return;
                    }

                    BlocProvider.of<HomeBloc>(context).add(
                      HomeSendMessageEvent(
                          message: _textEditingController.text.trim()),
                    );

                    _textEditingController.text = "";
                  },
                  child: NormalText("Send"),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.messages.length,
                    itemBuilder: (_, index) => ListTile(
                      title: Align(
                        alignment: state.messages[index].messageOwner ==
                                MessageOwner.RECIEVER
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: NormalText(
                          state.messages[index].message,
                          color: state.messages[index].messageOwner ==
                                  MessageOwner.RECIEVER
                              ? Colors.blue
                              : Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
                state is HomeLoadingState
                    ? CircularProgressIndicator()
                    : Container()
              ],
            );
          },
        ),
      ),
    );
  }
}
