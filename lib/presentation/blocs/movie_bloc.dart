import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/movie_usecases.dart';
import '../../domain/entities/movie.dart';
part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMovie getNowPlayingMovie;

  MovieBloc(this.getNowPlayingMovie) : super(MovieEmpty()) {
    on<GetNowPlaying>(
      (event, emit) async {
        emit(MovieLoading());
        final result = await getNowPlayingMovie.execute();
        result.fold((error) => emit(MovieError(error.message)), (data) {
          if (data.isEmpty) {
            emit(MovieEmpty());
          } else {
            emit(MovieSucces(data));
          }
        });
      },
    );
  }
}
