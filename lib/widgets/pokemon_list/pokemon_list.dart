import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/services/poke_api.dart';
import 'package:pokedex_app/widgets/pokemon_list/pokemon_row.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({
    super.key,
  });

  @override
  State<PokemonList> createState() {
    return _PokemonListState();
  }
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<Pokemon>> pokemons;

  @override
  void initState() {
    super.initState();
    pokemons = PokeApi.fetchPokemonsWithDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            const Text(
              'Pokedex',
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Search for a pokemon by name or using its National Pokedex number.',
            ),
            Expanded(
              child: FutureBuilder(
                future: pokemons,
                builder: (ctx, snapshot) => ListView.builder(
                  itemCount: snapshot.data!.length ~/ 2,
                  itemBuilder: (ctx, idx) => PokemonRow(
                    pokemonLeft: snapshot.data![2 * idx],
                    pokemonRight: snapshot.data![2 * idx + 1],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
