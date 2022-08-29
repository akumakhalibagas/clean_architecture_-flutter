import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:loyalty_white_label/data/datasources/remote/movie_remote_data_source.dart';
import 'package:loyalty_white_label/data/datasources/remote/service/movie_service.dart';
import 'package:loyalty_white_label/data/repositories/movie_repository_impl.dart';
import 'package:loyalty_white_label/domain/repositories/movie_repository.dart';
import 'package:loyalty_white_label/domain/usecases/movie_usecases.dart';
import 'package:loyalty_white_label/presentation/blocs/movie_bloc.dart';
import 'package:loyalty_white_label/presentation/provider/movie_provider.dart';
import 'data/datasources/remote/dio/dio_factory.dart';
import 'common/constants.dart';

final injector = GetIt.instance;

void init() {
  //dio
  injector.registerSingleton<Dio>(DioFactory(baseUrl: baseUrl).create());

  //provider
  injector.registerFactory(() => MovieNotifier(getNowPlayingMovie: injector()));

  //bloc
  injector.registerFactory(
    () => MovieBloc(
      injector(),
    ),
  );

  //usecases
  injector.registerLazySingleton(() => GetNowPlayingMovie(injector()));

  //repository
  injector.registerLazySingleton<MovieRepository>(
      () => MovieRepisitoryImpl(remoteDataSource: injector()));

  //remote data source
  injector.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(service: injector()));

  //service
  injector.registerLazySingleton<MovieService>(() => MovieService(injector()));
}
