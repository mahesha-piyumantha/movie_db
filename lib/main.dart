import 'package:flutter/material.dart';
import 'package:movie_db_mock_app/providers/movie_provider.dart';
import 'package:movie_db_mock_app/views/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
          create: (_) => MovieProvider(),
          child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Movie DB Mock App',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}

