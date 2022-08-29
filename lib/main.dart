import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_white_label/presentation/blocs/movie_bloc.dart';
import 'package:provider/provider.dart';
import 'injection.dart' as di;
import 'presentation/pages/movie_page.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => di.injector<MovieBloc>(),
        ),
      ],
      child: const MaterialApp(
        home: MoviePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();
