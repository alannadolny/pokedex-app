import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex_app/models/pokemon.dart';

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

  static Future<Pokemon> fetchPokemonDetails(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Pokemon.fromJson(json.decode(response.body));
    }

    throw Exception('Failed to fetch pokemon');
  }

  static Future<List<Pokemon>> fetchPokemonsWithDetails() async {
    final List<Pokemon> pokemonsList = await fetchPokemons();
    List<Future<Pokemon>> pokemonsWithDetails = pokemonsList
        .map((pokemon) => fetchPokemonDetails(pokemon.url!))
        .toList();

    return Future.wait(pokemonsWithDetails);
  }
}
