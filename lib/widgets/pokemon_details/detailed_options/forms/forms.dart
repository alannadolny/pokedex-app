import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/consts.dart';
import 'package:pokedex_app/models/evolution_chain.dart';
import 'package:pokedex_app/provider.dart';
import 'package:pokedex_app/widgets/loading_indicator.dart';
import 'package:pokedex_app/widgets/pokemon_details/detailed_options/forms/evolution_option.dart';

class Forms extends ConsumerWidget {
  final String? id;

  const Forms({
    this.id,
    super.key,
  });

  List<Widget> getEvolutionOptions(EvolutionChain evolutionChain) {
    return evolutionChain.pokemons
        .map((pokemon) => EvolutionOption(
              pokemon: pokemon,
              pokemonsCount: evolutionChain.pokemons.length,
              isActive: pokemon.id.toString() == id,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<EvolutionChain?> evolutionChain =
        ref.watch(evolutionChainProvider(id!));
    return evolutionChain.isLoading
        ? const LoadingIndicator()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: getEvolutionOptions(evolutionChain.value!),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Text(
                  EVOLUTION_FORM,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Text(
                  evolutionChain.value!.evolutionFormText!,
                ),
              ),
            ],
          );
  }
}
