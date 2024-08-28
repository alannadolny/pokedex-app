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

List<DetailsOption> POKEMON_DETAILS_OPTIONS = getPokemonDetailsOptions(null);
