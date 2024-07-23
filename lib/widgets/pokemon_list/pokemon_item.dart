import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon.dart';

class PokemonItem extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonItem({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: Colors.blueAccent,
      ),
      width: 190,
      height: 200,
      child: Text(pokemon.name),
    );
  }
}
