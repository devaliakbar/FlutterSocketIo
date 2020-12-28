part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  final List<HomeModel> messages;
  const HomeState({@required this.messages});

  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState {
  HomeLoadedState({@required List<HomeModel> messages})
      : super(messages: messages);
}

class HomeLoadingState extends HomeState {
  HomeLoadingState({@required List<HomeModel> messages})
      : super(messages: messages);
}
