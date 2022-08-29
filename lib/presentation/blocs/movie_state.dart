part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieLoading extends MovieState {
  const MovieLoading();
}

class MovieEmpty extends MovieState {
  const MovieEmpty();
}

class MovieSucces extends MovieState {
  final List<Movie> datas;

  const MovieSucces(this.datas);
  @override
  List<Object> get props => [datas];
}

class MovieError extends MovieState {
  final String msg;

  const MovieError(this.msg);
  @override
  List<Object> get props => [msg];
}
