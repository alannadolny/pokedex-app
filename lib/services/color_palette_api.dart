import 'package:palette_generator/palette_generator.dart';
import 'package:flutter/material.dart';

class ColorPaletteApi {
  static Future<PaletteGenerator> getColorPalette(String imageUrl) async {
    final PaletteGenerator paletteGenerator =
    await PaletteGenerator.fromImageProvider(
      Image.network(imageUrl).image,
    );

    return paletteGenerator;
  }
}