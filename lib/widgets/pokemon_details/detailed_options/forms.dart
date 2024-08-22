import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/provider.dart';

class Forms extends ConsumerWidget {
  final String? id;

  const Forms({
    this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final evolutionChain = ref.watch(evolutionChainProvider(id!));
    return Text(evolutionChain.value!.pokemons.map((e) => e.name).join(" "));
  }
}
