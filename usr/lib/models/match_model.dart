class Match {
  final String teamA;
  final String teamB;
  final String league;
  final double consistency; // 0.0 to 1.0
  final TeamAnalysis teamAStats;
  final TeamAnalysis teamBStats;
  final List<Recommendation> recommendations;

  Match({
    required this.teamA,
    required this.teamB,
    required this.league,
    required this.consistency,
    required this.teamAStats,
    required this.teamBStats,
    required this.recommendations,
  });
}

class TeamAnalysis {
  final Stats headToHead;
  final Stats last3Games;

  TeamAnalysis({required this.headToHead, required this.last3Games});
}

class Stats {
  final int min;
  final double avg;
  final int max;

  Stats({required this.min, required this.avg, required this.max});
}

enum RecommendationType { over, under }

class Recommendation {
  final String category; // e.g., 'Match Total', 'Team A Total', '1st Quarter'
  final RecommendationType type;
  final double value;
  final String description;

  Recommendation({
    required this.category,
    required this.type,
    required this.value,
    required this.description,
  });
}
