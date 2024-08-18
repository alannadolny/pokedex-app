import 'package:flutter/material.dart';
import 'package:pokedex_app/widgets/details_header.dart';

class PokemonDetails extends StatelessWidget {
  final String? id;

  const PokemonDetails({
    this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 35,
          horizontal: 15,
        ),
        child: Column(
          children: [
            DetailsHeader(),
          ],
        ),
      ),
    );
  }
}
