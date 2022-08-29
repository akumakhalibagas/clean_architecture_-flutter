import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../models/movie_response.dart';
part 'movie_service.g.dart';

@RestApi()
abstract class MovieService {
  factory MovieService(Dio dio) = _MovieService;

  @GET('/movie/now_playing')
  Future<HttpResponse<MovieResponse>> getNowPlayingMovies(
    @Query('api_key') String apiKey,
  );
}
