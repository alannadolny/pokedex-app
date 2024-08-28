import 'package:palette_generator/palette_generator.dart';

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
  });

  String get displayId {
    return id.toString().padLeft(3, '0');
  }

  String get displayName {
    return name[0].toUpperCase() + name.substring(1).toLowerCase();
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      height: json['height'],
      weight: json['weight'],
      order: json['order'],
      baseExperience: json['base_experience'],
      isDefault: json['is_default'],
      officialArtworkImage: json['sprites']?['other']?['official-artwork']
          ?['front_default'],
    );
  }
}
