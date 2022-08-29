import 'package:loyalty_white_label/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:loyalty_white_label/data/datasources/remote/dio/data_state.dart';
import 'package:loyalty_white_label/data/datasources/remote/movie_remote_data_source.dart';
import 'package:loyalty_white_label/domain/entities/movie.dart';
import 'package:loyalty_white_label/domain/repositories/movie_repository.dart';

class MovieRepisitoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepisitoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovie() async {
    try {
      final result = await remoteDataSource.getNowPlayingMovies();
      if (result is DataSuccess) {
        final data = result.data ?? List.empty();
        return Right(data.map((e) => e.toEntity()).toList());
      } else {
        final error = result.error ?? 'Undefined Error';
        return Left(MessageError(error));
      }
    } on MessageError {
      return const Left(MessageError(''));
    }
  }
}
