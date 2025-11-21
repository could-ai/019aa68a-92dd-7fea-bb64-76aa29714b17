import 'package:flutter/material.dart';
import '../models/match_model.dart';

class MatchCard extends StatelessWidget {
  final Match match;
  final VoidCallback onTap;

  const MatchCard({
    super.key,
    required this.match,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color consistencyColor;
    if (match.consistency > 0.8) {
      consistencyColor = Colors.green;
    } else if (match.consistency > 0.6) {
      consistencyColor = Colors.orange;
    } else {
      consistencyColor = Colors.red;
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                match.league,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[400]),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${match.teamA} vs ${match.teamB}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Row(
                    children: [
                      Icon(Icons.check_circle, color: consistencyColor, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        '${(match.consistency * 100).toStringAsFixed(0)}%',
                        style: TextStyle(color: consistencyColor, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
