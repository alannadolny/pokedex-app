import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/models/pokemon_type.dart';
import 'package:pokedex_app/provider.dart';
import 'package:pokedex_app/widgets/loading_indicator.dart';
import 'package:pokedex_app/widgets/pokemon_details/detailed_options/types/type_item.dart';

class Types extends ConsumerWidget {
  String? id;

  Types({
    this.id,
    super.key,
  });

  List<Widget> mapPokemonTypesToItems(
      List<PokemonType> pokemonTypes, String title) {
    if (pokemonTypes.isEmpty) {
      return [];
    }

    if (pokemonTypes.length == 1) {
      return [
        TypeItem(
          elementTitle: title,
          pokemonType: pokemonTypes.first,
        )
      ];
    }

    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 10,
            ),
          ),
          Text(
            '$title: ',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          ...pokemonTypes.map((type) => Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: TypeItem(pokemonType: type),
              ))
        ],
      )
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<PokemonType?> pokemonType = ref.watch(typeProvider(id!));
    return pokemonType.isLoading
        ? const LoadingIndicator()
        : SizedBox(
            height: 299,
            child: ListView(
              children: [
                ...mapPokemonTypesToItems([pokemonType.value!], 'Pokemon type'),
                ...mapPokemonTypesToItems(
                    pokemonType.value!.noDamageTo!, 'No damage to'),
                ...mapPokemonTypesToItems(
                    pokemonType.value!.halfDamageTo!, 'Half damage to'),
                ...mapPokemonTypesToItems(
                    pokemonType.value!.doubleDamageTo!, 'Double damage to'),
                ...mapPokemonTypesToItems(
                    pokemonType.value!.noDamageFrom!, 'No damage from'),
                ...mapPokemonTypesToItems(
                    pokemonType.value!.halfDamageFrom!, 'Half damage from'),
                ...mapPokemonTypesToItems(
                    pokemonType.value!.doubleDamageFrom!, 'Double damage from'),
              ],
            ),
          );
  }
}
