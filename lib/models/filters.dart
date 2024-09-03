// PokeAPI doesn't provide custom filters, so it should be done on the "frontend" part
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/services/poke_api.dart';

class Filters {
  List<Pokemon> allPokemonsName = [];
  String? term;

  Filters({
    required this.allPokemonsName,
    this.term,
  });

  void initFilters() async {
    allPokemonsName = await PokeApi.fetchAllPokemonsName();
  }

  List<Pokemon> getFilteredPokemonsList() {
    if (term == null) {
      return allPokemonsName.take(20).toList();
    }

    return allPokemonsName
        .where((element) => element.name.contains(term as Pattern))
        .take(20)
        .toList();
  }
}
