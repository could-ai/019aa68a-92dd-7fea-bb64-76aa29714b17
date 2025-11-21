import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/match_details_screen.dart';
import 'models/match_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Match Analysis',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/details': (context) {
          final match = ModalRoute.of(context)!.settings.arguments as Match;
          return MatchDetailsScreen(match: match);
        },
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
