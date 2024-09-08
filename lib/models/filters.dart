// PokeAPI doesn't provide custom filters, so it should be done on the "frontend" part
import 'dart:math';

import 'package:pokedex_app/consts.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/services/poke_api.dart';

class Filters {
  List<Pokemon> allPokemonsName = [];

  // Default sorting (by pokedex number)
  String sortOrder = POKEDEX_NUM_ASC;
  String? term;
  int defaultPageSize = MAX_PAGE_SIZE;

  // Page key is a number of displayed pokemon (loaded pokemons = page size * page key)
  int pageKey = DEFAULT_PAGE_KEY;

  Filters({
    required this.allPokemonsName,
    this.term,
  });

  void initFilters() async {
    allPokemonsName = await PokeApi.fetchAllPokemonsName();
  }

  void sortPokemons() {
    switch (sortOrder) {
      case NAME_ASC:
        allPokemonsName.sort((a, b) => a.name.compareTo(b.name));
        break;
      case NAME_DESC:
        allPokemonsName.sort((b, a) => a.name.compareTo(b.name));
        break;
      case POKEDEX_NUM_DESC:
        allPokemonsName.sort((b, a) => a.id!.compareTo(b.id!));
        break;
      default:
        allPokemonsName.sort((a, b) => a.id!.compareTo(b.id!));
    }
  }

  List<Pokemon> getFilteredPokemonsList() {
    (int, int) pokemonsRange =
        ((pageKey - 1) * defaultPageSize, pageKey * defaultPageSize);

    sortPokemons();
    if (term == null) {
      return allPokemonsName
          .getRange(pokemonsRange.$1, pokemonsRange.$2)
          .toList();
    }

    List<Pokemon> filteredPokemons = allPokemonsName
        .where((element) => element.name.contains(term as Pattern))
        .toList();

    return filteredPokemons
        .getRange(
          min(pokemonsRange.$1, filteredPokemons.length),
          min(pokemonsRange.$2, filteredPokemons.length),
        )
        .toList();
  }
}
