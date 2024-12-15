import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/jokes_list_screen.dart';
import 'screens/random_joke_screen.dart';

void main() {
  runApp(const JokesApp());
}

class JokesApp extends StatelessWidget {
  const JokesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokes App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomeScreen(),
        '/jokes': (context) => JokesListScreen(
          jokeType: ModalRoute.of(context)!.settings.arguments as String,
        ),
        '/random': (context) => RandomJokeScreen(),
      },
    );
  }
}
