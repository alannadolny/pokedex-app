import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/models/pokemon_stats.dart';
import 'package:pokedex_app/provider.dart';
import 'package:pokedex_app/widgets/loading_indicator.dart';
import 'package:pokedex_app/widgets/pokemon_details/detailed_options/stats/stat_info_box.dart';

class Stats extends ConsumerWidget {
  final String? id;

  const Stats({
    this.id,
    super.key,
  });

  List<Widget> mapStatsToInfoBoxes(List<PokemonStats> stats) {
    return stats
        .map((stat) => StatInfoBox(
              titleText: stat.displayName,
              leftText: 'Base stat: ${stat.baseStat}',
              rightText: 'Effort: ${stat.effort}',
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Pokemon?> pokemon = ref.watch(pokemonByIdProvider(id!));
    return pokemon.isLoading
        ? const LoadingIndicator()
        : SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView(
              children: mapStatsToInfoBoxes(pokemon.value!.pokemonStats!),
            ),
          );
  }
}
