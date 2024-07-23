import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class Pokemon {
  int? id;
  String name;
  String? url;
  String? officialArtworkImage;

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

  Future<PaletteGenerator> get colorPalette async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      Image.network(officialArtworkImage!).image,
    );

    return paletteGenerator;
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
