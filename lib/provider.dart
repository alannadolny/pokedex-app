import 'package:pokedex_app/models/pokemon.dart';
import 'models/evolution_chain.dart';
import 'package:pokedex_app/services/poke_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
Future<List<Pokemon>> pokemon(PokemonRef ref) async {
  return await PokeApi.fetchPokemonsWithDetails();
}

@riverpod
Future<Pokemon?> pokemonById(PokemonByIdRef ref, String id) async {
  final pokemons = ref.watch(pokemonProvider);
  return pokemons.value?.firstWhere((p) => p.id.toString() == id);
}

@riverpod
Future<EvolutionChain?> evolutionChain(EvolutionChainRef ref, String pokemonId) async {
  return await PokeApi.fetchEvolutionPath(pokemonId);
}