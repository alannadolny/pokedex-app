import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/models/filters.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/models/pokemon_type.dart';
import 'models/evolution_chain.dart';
import 'package:pokedex_app/services/poke_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

class FilterNotifier extends ChangeNotifier {
  Filters filters = Filters(allPokemonsName: []);

  void updateTerm(String newTerm) {
    filters.term = newTerm;
    notifyListeners();
  }

  void initialFetch() {
    if (filters.allPokemonsName.isEmpty) {
      filters.initFilters();
      notifyListeners();
    }
  }
}

final filterProvider = ChangeNotifierProvider((ref) => FilterNotifier());

@riverpod
Future<List<Pokemon>> pokemon(PokemonRef ref) async {
  final filters = ref.watch(filterProvider);
  return await PokeApi.fetchPokemonsWithDetails(filters.filters.getFilteredPokemonsList());
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

@riverpod
Future<PokemonType?> type(TypeRef ref, String pokemonId) async {
  return await PokeApi.fetchPokemonType(pokemonId);
}