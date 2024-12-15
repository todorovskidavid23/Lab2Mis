import 'package:flutter/material.dart';
import '../services/api_services.dart';
import '../models/joke_model.dart';
import '../widgets/joke_card_view.dart';

class JokesListScreen extends StatelessWidget {
  final String jokeType;

  JokesListScreen({super.key, required this.jokeType});

  final ApiServices jokesService = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${jokeType[0].toUpperCase()}${jokeType.substring(1)}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<List<Joke>>(
        future: ApiServices.getJokesByType(jokeType),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final jokes = snapshot.data!;
            return ListView.builder(
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                final joke = jokes[index];
                return JokeCardView(
                  setup: joke.setup,
                  punchline: joke.punchline,
                );
              },
            );
          }
        },
      ),
    );
  }
}