import 'package:pokedex_app/utils.dart';

class PokemonStats {
  String name;
  int? baseStat;
  int? effort;

  PokemonStats({
    required this.name,
    this.baseStat,
    this.effort,
  });

  String get displayName {
    if (name == 'hp') {
      return name.toUpperCase();
    }

    return name.split('-').map((element) => capitalize(element)).join(' ');
  }

  factory PokemonStats.fromJson(Map<String, dynamic> json) {
    return PokemonStats(
      name: json['stat']['name'],
      baseStat: json['base_stat'],
      effort: json['effort'],
    );
  }
}
