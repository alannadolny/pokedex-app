import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/provider.dart';
import 'package:pokedex_app/widgets/details_header.dart';
import 'package:pokedex_app/widgets/loading_indicator.dart';

class PokemonDetails extends ConsumerWidget {
  final String? id;

  const PokemonDetails({
    this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Pokemon?> pokemon = ref.watch(pokemonByIdProvider(id!));
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 35,
          horizontal: 15,
        ),
        child: pokemon.isLoading
        ? const LoadingIndicator()
        : Column(
          children: [
            DetailsHeader(
              name: pokemon.value!.displayName,
              id: pokemon.value!.displayId,
            ),
          ],
        ),
      ),
    );
  }
}
