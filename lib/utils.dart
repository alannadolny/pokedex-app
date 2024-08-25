import 'package:pokedex_app/widgets/pokemon_details/detailed_options/forms/forms.dart';
import 'package:pokedex_app/widgets/pokemon_details/detailed_options/temp_option.dart';

import 'consts.dart';
import 'models/details_option.dart';

List<DetailsOption> getPokemonDetailsOptions(String? pokemonId) {
  return [
    DetailsOption(title: FORMS_OPTION, widget: Forms(id: pokemonId)),
    DetailsOption(title: DETAILS_OPTION, widget: TempOption()),
    DetailsOption(title: TYPES_OPTION, widget: TempOption()),
    DetailsOption(title: STATS_OPTION, widget: TempOption()),
    DetailsOption(title: WEAKNESS_OPTION, widget: TempOption()),
    DetailsOption(title: STRENGTH_OPTION, widget: TempOption()),
  ];
}
