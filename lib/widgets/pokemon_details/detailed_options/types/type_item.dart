import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon_type.dart';

class TypeItem extends StatelessWidget {
  String? elementTitle;
  PokemonType pokemonType;

  TypeItem({
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
            fontSize: 18,
          ),
        ) : const SizedBox.shrink(),
        Text(
          pokemonType.displayType,
          style: const TextStyle(
            fontSize: 18,
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