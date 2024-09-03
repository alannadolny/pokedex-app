import 'package:pokedex_app/models/filters.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/models/pokemon_type.dart';
import 'models/evolution_chain.dart';
import 'package:pokedex_app/services/poke_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
Future<List<Pokemon>> pokemon(PokemonRef ref, String? term) async {
  Filters filters = Filters(allPokemonsName: [], term: term);
  filters.allPokemonsName = await PokeApi.fetchAllPokemonsName();
  return await PokeApi.fetchPokemonsWithDetails(filters.getFilteredPokemonsList());
}

@riverpod
Future<Pokemon?> pokemonById(PokemonByIdRef ref, String id) async {
  final pokemons = ref.watch(pokemonProvider(null));
  return pokemons.value?.firstWhere((p) => p.id.toString() == id);
}

@riverpod
Future<EvolutionChain?> evolutionChain(EvolutionChainRef ref, String pokemonId) async {
  return await PokeApi.fetchEvolutionPath(pokemonId);
}

@riverpod
Future<PokemonType?> type(TypeRef ref, String pokemonId) async {
  return await PokeApi.fetchPokemonType(pokemonId);
}