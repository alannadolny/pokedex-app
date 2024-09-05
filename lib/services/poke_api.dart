import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex_app/models/evolution_chain.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/models/pokemon_type.dart';
import 'package:pokedex_app/services/color_palette_api.dart';

class PokeApi {
  static Future<List<Pokemon>> fetchPokemons() async {
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/'));

    if (response.statusCode == 200) {
      return List.of(json.decode(response.body)['results'])
          .map((value) => Pokemon.fromJson(value))
          .toList();
    }

    throw Exception('Failed to fetch pokemons');
  }

  static Future<Pokemon> fetchPokemonDetails(
      String url, bool fetchColorPalette) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch pokemon');
    }

    Pokemon pokemon = Pokemon.fromJson(json.decode(response.body));

    if (!fetchColorPalette) {
      return pokemon;
    }

    pokemon.colorPalette = await ColorPaletteApi.getColorPalette(
        pokemon.officialArtworkImage as String);
    return pokemon;
  }

  static Future<List<Pokemon>> fetchPokemonsWithDetails(
      List<Pokemon>? pokemons) async {
    final List<Pokemon> pokemonsList = pokemons ?? await fetchPokemons();
    List<Future<Pokemon>> pokemonsWithDetails = pokemonsList
        .map((pokemon) => fetchPokemonDetails(pokemon.url!, true))
        .toList();

    return Future.wait(pokemonsWithDetails);
  }

  static List<String> getPokemonsFromEvolutionChain(
      Map<String, dynamic> evolutionPath) {
    List<String> pokemonsName = [];
    dynamic currentDepth = evolutionPath['chain'];
    String? currentPokemon = currentDepth['species']['name'];
    while (currentPokemon != null) {
      try {
        pokemonsName.add(currentPokemon);
        currentDepth = currentDepth?['evolves_to']?[0];
        currentPokemon = currentDepth?['species']?['name'];
      } catch (e) {
        currentPokemon = null;
      }
    }
    return pokemonsName;
  }

  static Future<EvolutionChain> fetchEvolutionPath(String pokemonId) async {
    EvolutionChain evolutionChain = EvolutionChain(
      mainPokemonId: pokemonId,
      pokemons: [],
      evolutionText: null,
    );
    final response = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon-species/$pokemonId'));

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch pokemon species');
    }

    evolutionChain.evolutionText =
        json.decode(response.body)['flavor_text_entries']?[0]?['flavor_text'];

    String urlToEvolutionPath =
        json.decode(response.body)?['evolution_chain']?['url'];

    final evolutionPath = await http.get(Uri.parse(urlToEvolutionPath));

    if (evolutionPath.statusCode != 200) {
      throw Exception('Failed to fetch evolution chain');
    }

    List<String> pokemons =
        getPokemonsFromEvolutionChain(json.decode(evolutionPath.body));
    evolutionChain.pokemons = await Future.wait(pokemons
        .map((pokemon) async => await fetchPokemonDetails(
            "https://pokeapi.co/api/v2/pokemon/$pokemon", true))
        .toList());
    return evolutionChain;
  }

  static Future<PokemonType> fetchPokemonType(String pokemonId) async {
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/type/$pokemonId'));

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch pokemon type');
    }

    return PokemonType.fromJson(json.decode(response.body));
  }

  static Future<List<Pokemon>> fetchAllPokemonsName() async {
    final response = await http
        .get(Uri.parse("https://pokeapi.co/api/v2/pokemon/?limit=-1"));

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch pokemons');
    }

    List<dynamic> pokemonsData = json.decode(response.body)['results'];

    return pokemonsData
        .map((pokemonData) => Pokemon.fromJson(pokemonData))
        .toList();
  }
}
