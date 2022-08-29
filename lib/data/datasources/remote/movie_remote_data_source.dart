import 'dart:io';
import 'dart:core';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'dio/dio_exception.dart';
import '../../datasources/remote/dio/data_state.dart';
import '../../datasources/remote/service/movie_service.dart';
import '../../models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<DataState<List<MovieModel>>> getNowPlayingMovies();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final MovieService service;

  MovieRemoteDataSourceImpl({required this.service});

  @override
  Future<DataState<List<MovieModel>>> getNowPlayingMovies() async {
    try {
      final httpResponse =
          await service.getNowPlayingMovies('2174d146bb9c0eab47529b2e77d6b526');
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.movieList);
      }
      return DataFailed(httpResponse.response.statusMessage);
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      if (kDebugMode) {
        print(e);
      }
      return DataFailed(errorMessage);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return DataFailed(e.toString());
    }
  }
}
