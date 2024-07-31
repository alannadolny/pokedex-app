import 'package:go_router/go_router.dart';
import 'package:pokedex_app/widgets/pokemon_details.dart';
import 'package:pokedex_app/widgets/pokemon_list/pokemon_list.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'pokemonList',
      path: '/',
      builder: (context, state) => const PokemonList(),
    ),
    GoRoute(
      name: 'pokemonDetails',
      path: '/:id',
      builder: (context, state) => const PokemonDetails(),
    ),
  ],
);