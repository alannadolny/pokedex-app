import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() {
    return _PokemonListState();
  }
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<Pokemon>> pokemons;

  Future<List<Pokemon>> fetchPokemons() async {
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon'));

    if (response.statusCode == 200) {
      return List.of(json.decode(response.body)['results'])
          .map((value) => Pokemon.fromJson(value))
          .toList();
    }

    throw Exception('Failed to fetch pokemons');
  }

  @override
  void initState() {
    super.initState();
    pokemons = fetchPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
        ),
        child: Column(
          children: [
            const Text(
              'Pokedex',
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Search for a pokemon by name or using its National Pokedex number.',
            ),
            Expanded(
              child: FutureBuilder(
                future: pokemons,
                builder: (ctx, snapshot) => ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (ctx, idx) => Text(snapshot.data![idx].name),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
