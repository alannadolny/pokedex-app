import 'dart:ui';

import 'package:pokedex_app/models/details_option.dart';
import 'package:pokedex_app/utils.dart';

const DEFAULT_COLOR = Color.fromRGBO(42, 43, 88, 1);
const DEFAULT_LIGHT_COLOR = Color.fromRGBO(234, 243, 245, 1);
const DEFAULT_GRAY = Color.fromRGBO(146, 147, 168, 1);

const FORMS_OPTION = 'Forms';
const DETAILS_OPTION = 'Details';
const DAMAGE_RELATIONS_OPTION = 'Damage relations';
const STATS_OPTION = 'Stats';

const EVOLUTION_FORM = 'Evolution Form';

const HEIGHT_DESCRIPTION = 'The height of this Pokémon in decimetres.';
const WEIGHT_DESCRIPTION = 'The weight of this Pokémon in hectograms.';
const ORDER_DESCRIPTION = 'Order for sorting. Almost national order, except families are grouped together.';
const BASE_EXPERIENCE_DESCRIPTION = 'The base experience gained for defeating this Pokémon.';
const IS_DEFAULT_DESCRIPTION = 'Set for exactly one Pokémon used as the default for each species.';

const NAME_ASC = 'NAME_ASC';
const NAME_DESC = 'NAME_DESC';
const POKEDEX_NUM_ASC = 'POKEDEX_NUM_ASC';
const POKEDEX_NUM_DESC = 'POKEDEX_NUM_DESC';

const ORDERING_OPTIONS = {
  NAME_ASC: 'Name (ascending)',
  NAME_DESC: 'Name (descending)',
  POKEDEX_NUM_ASC: 'Pokedex number (ascending)',
  POKEDEX_NUM_DESC: 'Pokedex number (descending)',
};

List<DetailsOption> POKEMON_DETAILS_OPTIONS = getPokemonDetailsOptions(null);
