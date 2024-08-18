import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/provider.dart';
import 'package:pokedex_app/widgets/loading_indicator.dart';
import 'package:pokedex_app/widgets/pokemon_list/pokemon_row.dart';
import 'package:pokedex_app/widgets/pokemon_list/list_header.dart';

class PokemonList extends ConsumerStatefulWidget {
  const PokemonList({
    super.key,
  });

  @override
  ConsumerState<PokemonList> createState() {
    return _PokemonListState();
  }
}

class _PokemonListState extends ConsumerState<PokemonList> {
  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Pokemon>> pokemons = ref.watch(pokemonProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            Expanded(
              child: pokemons.isLoading
                  ? const LoadingIndicator()
                  : ListView.builder(
                      itemCount: pokemons.value!.length ~/ 2,
                      itemBuilder: (ctx, idx) => idx == 0
                          ? Column(
                              children: [
                                const ListHeader(),
                                PokemonRow(
                                  pokemonLeft: pokemons.value![2 * idx],
                                  pokemonRight: pokemons.value![2 * idx + 1],
                                ),
                              ],
                            )
                          : PokemonRow(
                              pokemonLeft: pokemons.value![2 * idx],
                              pokemonRight: pokemons.value![2 * idx + 1],
                            ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
