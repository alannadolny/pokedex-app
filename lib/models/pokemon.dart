import 'package:palette_generator/palette_generator.dart';
import 'package:pokedex_app/models/pokemon_stats.dart';
import 'package:pokedex_app/utils.dart';

class Pokemon {
  int? id;
  String name;
  String? url;
  String? officialArtworkImage;
  PaletteGenerator? colorPalette;
  int? height;
  int? weight;
  int? order;
  int? baseExperience;
  bool? isDefault;
  String? generation;
  List<PokemonStats>? pokemonStats = [];

  Pokemon({
    required this.name,
    this.id,
    this.url,
    this.officialArtworkImage,
    this.height,
    this.weight,
    this.baseExperience,
    this.order,
    this.isDefault,
    this.pokemonStats,
  });

  String get displayId {
    return id.toString().padLeft(3, '0');
  }

  String get displayName {
    return capitalize(name);
  }

  static List<PokemonStats>? mapJsonToPokemonStats(List<dynamic>? json) {
    if (json == null) {
      return [];
    }

    return json.map((stat) => PokemonStats.fromJson(stat)).toList();
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'] ?? int.parse(json['url'].toString().split('/')[6]),
      name: json['name'],
      url: json['url'],
      height: json['height'],
      weight: json['weight'],
      order: json['order'],
      baseExperience: json['base_experience'],
      isDefault: json['is_default'],
      pokemonStats: mapJsonToPokemonStats(json['stats']),
      officialArtworkImage: json['sprites']?['other']?['official-artwork']
          ?['front_default'],
    );
  }
}
