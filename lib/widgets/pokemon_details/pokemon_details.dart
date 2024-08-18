import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/provider.dart';
import 'package:pokedex_app/widgets/pokemon_details/details_header.dart';
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
          horizontal: 35,
        ),
        child: pokemon.isLoading
            ? const LoadingIndicator()
            : Column(
                children: [
                  DetailsHeader(
                    name: pokemon.value!.displayName,
                    id: pokemon.value!.displayId,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 50,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: pokemon.value!.colorPalette!.dominantColor!.color,
                    ),
                    child: Image.network(
                      pokemon.value!.officialArtworkImage!,
                      height: 350,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
