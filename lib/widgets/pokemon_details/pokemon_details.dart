import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/provider.dart';
import 'package:pokedex_app/utils.dart';
import 'package:pokedex_app/widgets/pokemon_details/details_header.dart';
import 'package:pokedex_app/widgets/loading_indicator.dart';
import 'package:pokedex_app/widgets/pokemon_details/options_list.dart';


class PokemonDetails extends ConsumerStatefulWidget {
  final String? id;
  int currentOption = 0;

  PokemonDetails({
    this.id,
    super.key,
  });

  @override
  ConsumerState<PokemonDetails> createState() {
    return _PokemonDetailsState();
  }
}

class _PokemonDetailsState extends ConsumerState<PokemonDetails> {
  void Function() changeActiveOption(int optionIdx) {
    return () {
      setState(() {
        widget.currentOption = optionIdx;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<Pokemon?> pokemon =
        ref.watch(pokemonByIdProvider(widget.id!));
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
                  OptionsList(
                    activeOption: widget.currentOption,
                    onOptionClick: changeActiveOption,
                  ),
                  getPokemonDetailsOptions(widget.id)[widget.currentOption].widget,
                ],
              ),
      ),
    );
  }
}
