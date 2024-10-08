import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon_type.dart';

class TypeItem extends StatelessWidget {
  final String? elementTitle;
  final PokemonType pokemonType;

  const TypeItem({
    required this.pokemonType,
    this.elementTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        elementTitle != null ? Text(
          '$elementTitle: ',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ) : const SizedBox.shrink(),
        Text(
          pokemonType.displayType,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        pokemonType.image != null ? SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width / 10,
          child: Image(image: pokemonType.image!),
        ) : const SizedBox.shrink()
      ],
    );
  }
}