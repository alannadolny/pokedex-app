class Pokemon {
  String name;

  Pokemon({required this.name});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'name': String name,
      } =>
        Pokemon(
          name: name,
        ),
      _ => throw const FormatException('Failed to fetch pokemon.'),
    };
  }
}
