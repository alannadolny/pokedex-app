import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_app/models/pokemon.dart';

class PokemonItem extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonItem({
    super.key,
    required this.pokemon,
  });

  @override
  State<PokemonItem> createState() {
    return _PokemonItemState();
  }
}

class _PokemonItemState extends State<PokemonItem> {
  void onPokemonTap() {
    context.goNamed(
      'pokemonDetails',
      pathParameters: {'id': 'uniqueId'},
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPokemonTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          color: widget.pokemon.colorPalette?.dominantColor?.color,
        ),
        width: 190,
        height: 280,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 10,
            ),
            Image.network(
              widget.pokemon.officialArtworkImage!,
              height: 150,
            ),
            Column(
              children: [
                Text(
                  widget.pokemon.displayName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(
                  widget.pokemon.displayId,
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
