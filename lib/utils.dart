import 'package:pokedex_app/widgets/pokemon_details/detailed_options/details/details.dart';
import 'package:pokedex_app/widgets/pokemon_details/detailed_options/forms/forms.dart';
import 'package:pokedex_app/widgets/pokemon_details/detailed_options/stats/stats.dart';
import 'package:pokedex_app/widgets/pokemon_details/detailed_options/types/types.dart';

import 'consts.dart';
import 'models/details_option.dart';

List<DetailsOption> getPokemonDetailsOptions(String? pokemonId) {
  return [
    DetailsOption(title: FORMS_OPTION, widget: Forms(id: pokemonId)),
    DetailsOption(title: DETAILS_OPTION, widget: Details(id: pokemonId)),
    DetailsOption(title: DAMAGE_RELATIONS_OPTION, widget: Types(id: pokemonId)),
    DetailsOption(title: STATS_OPTION, widget: Stats(id: pokemonId)),
  ];
}

String capitalize(String text) {
  return text[0].toUpperCase() + text.substring(1).toLowerCase();
}

List<dynamic> takeLast(List<dynamic> list, int n) {
  return list.reversed.take(n).toList().reversed.toList();
}

bool hasIndex(List<dynamic> list, int index) {
  return list.asMap().containsKey(index);
}
