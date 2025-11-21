import 'package:flutter/material.dart';
import '../models/match_model.dart';

class MatchDetailsScreen extends StatelessWidget {
  final Match match;

  const MatchDetailsScreen({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${match.teamA} vs ${match.teamB}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, 'Analyse des Données'),
            _buildStatsCard(context, match.teamA, match.teamAStats),
            const SizedBox(height: 16),
            _buildStatsCard(context, match.teamB, match.teamBStats),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'Recommandations de Paris'),
            ...match.recommendations.map((rec) => _buildRecommendationCard(context, rec)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildStatsCard(BuildContext context, String teamName, TeamAnalysis analysis) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(teamName, style: Theme.of(context).textTheme.titleLarge),
            const Divider(height: 20),
            Text('Face-à-face (4-5 derniers)', style: Theme.of(context).textTheme.titleMedium),
            _buildStatRow('Min Score', analysis.headToHead.min.toString()),
            _buildStatRow('Moy. Score', analysis.headToHead.avg.toStringAsFixed(1)),
            _buildStatRow('Max Score', analysis.headToHead.max.toString()),
            const SizedBox(height: 12),
            Text('3 derniers matchs', style: Theme.of(context).textTheme.titleMedium),
            _buildStatRow('Min Score', analysis.last3Games.min.toString()),
            _buildStatRow('Moy. Score', analysis.last3Games.avg.toStringAsFixed(1)),
            _buildStatRow('Max Score', analysis.last3Games.max.toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildRecommendationCard(BuildContext context, Recommendation rec) {
    final isOver = rec.type == RecommendationType.over;
    final color = isOver ? Colors.green : Colors.red;
    final icon = isOver ? Icons.arrow_upward : Icons.arrow_downward;
    final title = 'À JOUER POUR ${isOver ? "+" : "-"}';

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              rec.category,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Divider(height: 20),
            Row(
              children: [
                Icon(icon, color: color),
                const SizedBox(width: 8),
                Text(
                  '$title ${rec.value}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: color, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              rec.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
