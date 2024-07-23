import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/widgets/pokemon_list/pokemon_item.dart';

class PokemonRow extends StatelessWidget {
  final Pokemon pokemonLeft;
  final Pokemon pokemonRight;

  const PokemonRow({
    super.key,
    required this.pokemonLeft,
    required this.pokemonRight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        PokemonItem(pokemon: pokemonLeft),
        PokemonItem(pokemon: pokemonRight),
      ],
    );
  }

}