import 'package:flutter/material.dart';
import 'package:pokedex_app/widgets/pokemon_list/pokemon_list.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PokemonList(),
    );
  }
}