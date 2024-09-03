import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/provider.dart';
import 'package:pokedex_app/widgets/loading_indicator.dart';
import 'package:pokedex_app/widgets/pokemon_list/pokemon_row.dart';
import 'package:pokedex_app/widgets/pokemon_list/list_header.dart';

class PokemonList extends ConsumerWidget {
  const PokemonList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Pokemon>> pokemons = ref.watch(pokemonProvider);
    final FilterNotifier filters = ref.watch(filterProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      filters.initialFetch();
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            ListHeader(
              onTextEnter: filters.updateTerm,
            ),
            Expanded(
              child: pokemons.isLoading
                  ? const LoadingIndicator()
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: pokemons.value!.length ~/ 2,
                      itemBuilder: (ctx, idx) => idx == 0
                          ? Column(
                              children: [
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
