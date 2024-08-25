import 'package:pokedex_app/models/pokemon.dart';

class EvolutionChain {
  String? mainPokemonId;
  List<Pokemon> pokemons = [];
  String? evolutionText;

  String? get evolutionFormText {
    return evolutionText?.replaceAll("\n", " ");
  }

  EvolutionChain({
      required this.mainPokemonId,
      required this.pokemons,
      required this.evolutionText,
  });
}
