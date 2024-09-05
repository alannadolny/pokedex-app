// PokeAPI doesn't provide custom filters, so it should be done on the "frontend" part
import 'package:pokedex_app/consts.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/services/poke_api.dart';

class Filters {
  List<Pokemon> allPokemonsName = [];
  // Default sorting (by pokedex number)
  String sortOrder = POKEDEX_NUM_ASC;
  String? term;

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
    sortPokemons();
    if (term == null) {
      return allPokemonsName.take(20).toList();
    }

    return allPokemonsName
        .where((element) => element.name.contains(term as Pattern))
        .take(20)
        .toList();
  }
}
