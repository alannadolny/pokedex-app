import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/consts.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/provider.dart';
import 'package:pokedex_app/widgets/loading_indicator.dart';
import 'package:pokedex_app/widgets/pokemon_details/detailed_options/details/info_box.dart';

class Details extends ConsumerWidget {
  String? id;

  Details({
    this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Pokemon?> pokemon = ref.watch(pokemonByIdProvider(id!));
    return pokemon.isLoading
        ? const LoadingIndicator()
        : SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                InfoBox(
                  descriptionText: HEIGHT_DESCRIPTION,
                  dataText: pokemon.value!.height.toString(),
                ),
                InfoBox(
                  descriptionText: WEIGHT_DESCRIPTION,
                  dataText: pokemon.value!.weight.toString(),
                ),
                InfoBox(
                  descriptionText: ORDER_DESCRIPTION,
                  dataText: pokemon.value!.order.toString(),
                ),
                InfoBox(
                  descriptionText: BASE_EXPERIENCE_DESCRIPTION,
                  dataText: pokemon.value!.baseExperience.toString(),
                ),
                InfoBox(
                  descriptionText: IS_DEFAULT_DESCRIPTION,
                  dataText: pokemon.value!.isDefault.toString(),
                ),
              ],
            ),
          );
  }
}
