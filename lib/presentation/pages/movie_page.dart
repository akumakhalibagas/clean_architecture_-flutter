import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_white_label/presentation/blocs/movie_bloc.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  void initState() {
    super.initState();
    context.read<MovieBloc>().add(GetNowPlaying());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              BlocBuilder<MovieBloc, MovieState>(
                builder: (context, state) {
                  if (state is MovieLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is MovieSucces) {
                    return SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final data = state.datas[index];
                          return ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                            child: SizedBox(
                              height: 120,
                              width: 150,
                              child: Image.network(
                                  'https://image.tmdb.org/t/p/w500${data.posterPath}'),
                            ),
                          );
                        },
                        itemCount: state.datas.length,
                      ),
                    );
                  } else if (state is MovieError) {
                    return Center(
                      child: Text(state.msg),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
