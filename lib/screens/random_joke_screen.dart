import 'package:flutter/material.dart';
import '../services/api_services.dart';
import '../models/joke_model.dart';
import '../widgets/joke_card_view.dart';

class RandomJokeScreen extends StatelessWidget {
  final ApiServices jokesService = ApiServices();

  RandomJokeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Random Joke',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<Joke>(
        future: ApiServices.getRandomJoke(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final joke = snapshot.data!;
            return Center(
              child: JokeCardView(
                setup: joke.setup,
                punchline: joke.punchline,
              ),
            );
          }
        },
      ),
    );
  }
}