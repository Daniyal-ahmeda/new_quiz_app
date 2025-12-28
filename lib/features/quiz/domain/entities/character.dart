class Character {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Map<String, int> stats; // e.g., {'strength': 10, 'intelligence': 15}
  final List<String> skills;

  const Character({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
    this.stats = const {},
    this.skills = const [],
  });
}
