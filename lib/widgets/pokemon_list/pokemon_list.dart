import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedex_app/consts.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/provider.dart';
import 'package:pokedex_app/utils.dart';
import 'package:pokedex_app/widgets/loading_indicator.dart';
import 'package:pokedex_app/widgets/pokemon_list/pokemon_row.dart';
import 'package:pokedex_app/widgets/pokemon_list/list_header.dart';

class PokemonList extends ConsumerWidget {
  const PokemonList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(pokemonProvider);
    final FilterNotifier filters = ref.watch(filterProvider);
    final PagingNotifier pagingController = ref.watch(pagingProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      filters.initialFetch();
      pagingController.initPagingController();
    });

    Widget buildPokemonsList(BuildContext context, Pokemon item, int idx) {
      if (idx % 2 == 0) {
        return const SizedBox.shrink();
      }

      int leftElementIndex = 2 * (idx ~/ 2);
      return PokemonRow(
        pokemonLeft: pagingController.getPokemonAt(leftElementIndex),
        pokemonRight: hasIndex(pagingController.getPokemonsList()!, leftElementIndex + 1)
            ? pagingController.getPokemonAt(leftElementIndex + 1)
            : null,
      );
    }

    void onFiltersChange(String newTerm) {
      filters.updatePageKey(DEFAULT_PAGE_KEY);
      pagingController.resetController();
      filters.updateTerm(newTerm);
    }

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
              onTextEnter: onFiltersChange,
            ),
            Expanded(
              child: pagingController.isLoaded()
                  ? PagedListView(
                      padding: EdgeInsets.zero,
                      pagingController: pagingController.getController(),
                      builderDelegate: PagedChildBuilderDelegate<Pokemon>(
                        itemBuilder: buildPokemonsList,
                      ),
                    )
                  : const LoadingIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
