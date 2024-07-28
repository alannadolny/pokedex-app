import 'package:palette_generator/palette_generator.dart';

class Pokemon {
  int? id;
  String name;
  String? url;
  String? officialArtworkImage;
  PaletteGenerator? colorPalette;

  Pokemon({
    required this.name,
    this.id,
    this.url,
    this.officialArtworkImage,
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
      officialArtworkImage: json['sprites']?['other']?['official-artwork']
          ?['front_default'],
    );
  }
}
