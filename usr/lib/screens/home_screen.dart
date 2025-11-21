import 'package:flutter/material.dart';
import '../models/match_model.dart';
import '../widgets/match_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Mock data - this would be fetched from your backend
  final List<Match> _matches = [
    Match(
      teamA: 'Lakers',
      teamB: 'Clippers',
      league: 'NBA',
      consistency: 0.9,
      teamAStats: TeamAnalysis(
        headToHead: Stats(min: 98, avg: 105.5, max: 112),
        last3Games: Stats(min: 101, avg: 108.2, max: 115),
      ),
      teamBStats: TeamAnalysis(
        headToHead: Stats(min: 100, avg: 104.1, max: 110),
        last3Games: Stats(min: 105, avg: 109.0, max: 114),
      ),
      recommendations: [
        Recommendation(
          category: 'Match Total',
          type: RecommendationType.over,
          value: 215.5,
          description: 'Les deux équipes ont une forte tendance à marquer. Le total combiné devrait dépasser 215.5 points.',
        ),
        Recommendation(
          category: 'Lakers',
          type: RecommendationType.over,
          value: 107.5,
          description: 'Les Lakers ont une moyenne de plus de 107.5 points dans leurs matchs récents et face-à-face.',
        ),
      ],
    ),
    Match(
      teamA: 'Real Madrid',
      teamB: 'Barcelona',
      league: 'Espagne',
      consistency: 0.75,
      teamAStats: TeamAnalysis(
        headToHead: Stats(min: 78, avg: 85.2, max: 92),
        last3Games: Stats(min: 80, avg: 84.0, max: 88),
      ),
      teamBStats: TeamAnalysis(
        headToHead: Stats(min: 75, avg: 82.5, max: 90),
        last3Games: Stats(min: 79, avg: 83.1, max: 87),
      ),
      recommendations: [
        Recommendation(
          category: 'Match Total',
          type: RecommendationType.under,
          value: 168.5,
          description: 'Les matchs entre ces deux équipes sont souvent défensifs. Le total combiné devrait être inférieur à 168.5 points.',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matchs Recommandés'),
      ),
      body: ListView.builder(
        itemCount: _matches.length,
        itemBuilder: (context, index) {
          final match = _matches[index];
          return MatchCard(
            match: match,
            onTap: () {
              Navigator.pushNamed(context, '/details', arguments: match);
            },
          );
        },
      ),
    );
  }
}
