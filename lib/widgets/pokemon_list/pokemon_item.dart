import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_app/models/pokemon.dart';

class PokemonItem extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonItem({
    required this.pokemon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void onPokemonTap() {
      context.goNamed(
        'pokemonDetails',
        pathParameters: {'id': "${pokemon.id}"},
      );
    }

    return GestureDetector(
      onTap: onPokemonTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          color: pokemon.colorPalette?.dominantColor?.color,
        ),
        width: MediaQuery
            .of(context)
            .size
            .width / 2 - 30,
        height: 280,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 10,
            ),
            Image.network(
              pokemon.officialArtworkImage!,
              height: 150,
            ),
            Column(
              children: [
                Text(
                  pokemon.displayName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(
                  pokemon.displayId,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
