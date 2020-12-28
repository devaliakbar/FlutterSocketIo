import 'package:get_it/get_it.dart';
import 'package:soket_io/core/helper/track_context.dart';
import 'package:soket_io/core/socket_io/socket_io.dart';
import 'package:soket_io/features/home/bloc/home_bloc.dart';
import 'package:soket_io/features/home/bloc/repo/home_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory<HomeBloc>(
    () => HomeBloc(sl()),
  );

  sl.registerSingleton<HomeRepo>(HomeRepo());

  sl.registerSingleton<TrackContext>(TrackContext());
  sl.registerSingleton<SocketIo>(SocketIo());
}
