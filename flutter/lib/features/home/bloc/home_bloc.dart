import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:soket_io/features/home/bloc/repo/home_model.dart';
import 'package:soket_io/features/home/bloc/repo/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepo _homeRepo;

  HomeBloc(this._homeRepo)
      : super(HomeLoadedState(messages: _homeRepo.messages));

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeSendMessageEvent) {
      yield HomeLoadingState(messages: _homeRepo.messages);
      await Future.delayed(Duration(milliseconds: 300));
      _homeRepo.sendMessage(event.message);
      yield HomeLoadedState(messages: _homeRepo.messages);
    } else if (event is HomeRecieveMessageEvent) {
      yield HomeLoadingState(messages: _homeRepo.messages);
      await Future.delayed(Duration(milliseconds: 300));
      _homeRepo.messageRecieved(event.message);
      yield HomeLoadedState(messages: _homeRepo.messages);
    }
  }
}
