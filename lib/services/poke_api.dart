import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:palette_generator/palette_generator.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/services/color_palette_api.dart';

class PokeApi {
  static Future<List<Pokemon>> fetchPokemons() async {
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon'));

    if (response.statusCode == 200) {
      return List.of(json.decode(response.body)['results'])
          .map((value) => Pokemon.fromJson(value))
          .toList();
    }

    throw Exception('Failed to fetch pokemons');
  }

  static Future<Pokemon> fetchPokemonDetails(String url, bool fetchColorPalette) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch pokemon');
    }

    Pokemon pokemon = Pokemon.fromJson(json.decode(response.body));

    if (!fetchColorPalette) {
      return pokemon;
    }

    pokemon.colorPalette = await ColorPaletteApi.getColorPalette(pokemon.officialArtworkImage as String);
    return pokemon;
  }

  static Future<List<Pokemon>> fetchPokemonsWithDetails() async {
    final List<Pokemon> pokemonsList = await fetchPokemons();
    List<Future<Pokemon>> pokemonsWithDetails = pokemonsList
        .map((pokemon) => fetchPokemonDetails(pokemon.url!, true))
        .toList();

    return Future.wait(pokemonsWithDetails);
  }
}
