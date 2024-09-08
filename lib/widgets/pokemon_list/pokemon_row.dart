import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/widgets/pokemon_list/pokemon_item.dart';

class PokemonRow extends StatelessWidget {
  final Pokemon? pokemonLeft;
  final Pokemon? pokemonRight;

  const PokemonRow({
    super.key,
    this.pokemonLeft,
    this.pokemonRight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        pokemonLeft != null
            ? PokemonItem(
                pokemon: pokemonLeft!,
              )
            : const SizedBox.shrink(),
        pokemonRight != null
            ? PokemonItem(
                pokemon: pokemonRight!,
              )
            : SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 30,
              ),
      ],
    );
  }
}
