import 'package:pokedex_app/widgets/pokemon_details/detailed_options/forms/forms.dart';
import 'package:pokedex_app/widgets/pokemon_details/detailed_options/temp_option.dart';
import 'package:pokedex_app/widgets/pokemon_details/detailed_options/types/types.dart';

import 'consts.dart';
import 'models/details_option.dart';

List<DetailsOption> getPokemonDetailsOptions(String? pokemonId) {
  return [
    DetailsOption(title: FORMS_OPTION, widget: Forms(id: pokemonId)),
    DetailsOption(title: DETAILS_OPTION, widget: TempOption()),
    DetailsOption(title: DAMAGE_RELATIONS_OPTION, widget: Types(id: pokemonId)),
    DetailsOption(title: STATS_OPTION, widget: TempOption()),
  ];
}
