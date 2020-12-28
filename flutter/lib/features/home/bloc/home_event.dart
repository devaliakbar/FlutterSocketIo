part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeSendMessageEvent extends HomeEvent {
  final String message;
  HomeSendMessageEvent({this.message});
  @override
  List<Object> get props => [message];
}

class HomeRecieveMessageEvent extends HomeEvent {
  final String message;
  HomeRecieveMessageEvent({this.message});
  @override
  List<Object> get props => [message];
}
