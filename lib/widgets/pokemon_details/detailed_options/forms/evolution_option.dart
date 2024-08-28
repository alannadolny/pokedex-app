import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_app/models/pokemon.dart';

class EvolutionOption extends StatelessWidget {
  final Pokemon pokemon;
  final int pokemonsCount;
  final bool isActive;

  const EvolutionOption({
    required this.pokemon,
    required this.pokemonsCount,
    required this.isActive,
    super.key,
  });

  void Function() redirectToPokemonOnTap(BuildContext context) {
    return () {
      return context.goNamed(
        'pokemonDetails',
        pathParameters: {'id': "${pokemon.id}" },
      );
    };
  }

  double getOptionSize(BuildContext context) {
    return (MediaQuery.of(context).size.width / pokemonsCount) - (
    pokemonsCount == 2 ? 50 : 35
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: redirectToPokemonOnTap(context),
      child: Opacity(
        opacity: isActive ? 1 : 0.5,
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            color: pokemon.colorPalette?.dominantColor?.color,
          ),
          width: getOptionSize(context),
          child: Image.network(pokemon.officialArtworkImage!),
        ),
      )
    );
  }
}
