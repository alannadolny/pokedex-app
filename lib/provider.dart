import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedex_app/consts.dart';
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

  void updateSortOrder(String order) {
    filters.sortOrder = order;
    notifyListeners();
  }

  void updatePageKey(int pageKey) {
    filters.pageKey = pageKey;
  }

  void initialFetch() {
    if (filters.allPokemonsName.isEmpty) {
      filters.initFilters();
      notifyListeners();
    }
  }

  List<Pokemon> getPokemonList() {
    return filters.getFilteredPokemonsList();
  }

  bool isCurrentSortOrder(String order) {
    return order == filters.sortOrder;
  }
}

final filterProvider = ChangeNotifierProvider((ref) => FilterNotifier());

class PagingNotifier extends ChangeNotifier {
  int pageKey = DEFAULT_PAGE_KEY;
  bool fetchingFinished = false;
  final PagingController<int, Pokemon> pagingController = PagingController(
    firstPageKey: 1,
  );

  void appendPokemons(List<Pokemon> pokemons) {
    fetchingFinished = true;
    if (pokemons.length < MAX_PAGE_SIZE) {
      pagingController.appendLastPage(pokemons);
      return;
    }
    pagingController.appendPage(pokemons, pageKey);
    pageKey += 1;
  }

  bool isLoaded() {
    return pagingController.itemList != null && fetchingFinished;
  }

  List<Pokemon>? getPokemonsList() {
    return pagingController.itemList ?? [];
  }

  Pokemon? getPokemonAt(int index) {
    return getPokemonsList()?[index];
  }

  Pokemon? getPokemonById(String id) {
    return getPokemonsList()?.firstWhere((p) => p.id.toString() == id);
  }

  void initPagingController() {
    if (isLoaded()) {
      pagingController.addPageRequestListener((pageKey) {
        notifyListeners();
      });
    }
  }

  void resetController() {
    pagingController.refresh();
    fetchingFinished = false;
    pageKey = DEFAULT_PAGE_KEY;
  }

  PagingController<int, Pokemon> getController() {
    return pagingController;
  }
}

final pagingProvider = ChangeNotifierProvider((ref) => PagingNotifier());

@riverpod
Future<List<Pokemon>> pokemon(PokemonRef ref) async {
  final filters = ref.watch(filterProvider);
  final pagingController = ref.watch(pagingProvider);
  filters.updatePageKey(pagingController.pageKey);
  final pokemons =
      await PokeApi.fetchPokemonsWithDetails(filters.getPokemonList());
  pagingController.appendPokemons(pokemons);
  return pokemons;
}

@riverpod
Future<Pokemon?> pokemonById(PokemonByIdRef ref, String id) async {
  final pagingController = ref.watch(pagingProvider);
  return pagingController.getPokemonById(id);
}

@riverpod
Future<EvolutionChain?> evolutionChain(
    EvolutionChainRef ref, String pokemonId) async {
  return await PokeApi.fetchEvolutionPath(pokemonId);
}

@riverpod
Future<PokemonType?> type(TypeRef ref, String pokemonId) async {
  return await PokeApi.fetchPokemonType(pokemonId);
}
