import 'package:flutter/material.dart';
import 'package:pokedex_app/utils.dart';

class PokemonType {
  int? id;
  String type;
  AssetImage? image;
  List<PokemonType>? noDamageTo = [];
  List<PokemonType>? halfDamageTo = [];
  List<PokemonType>? doubleDamageTo = [];
  List<PokemonType>? noDamageFrom = [];
  List<PokemonType>? halfDamageFrom = [];
  List<PokemonType>? doubleDamageFrom = [];

  PokemonType({
    required this.type,
    this.image,
    this.id,
    this.noDamageTo,
    this.halfDamageTo,
    this.doubleDamageTo,
    this.noDamageFrom,
    this.halfDamageFrom,
    this.doubleDamageFrom,
  });

  String get displayType {
    return type[0].toUpperCase() + type.substring(1).toLowerCase();
  }

  static List<PokemonType> mapDamageRelationToPokemonType(
      Map<String, dynamic> json, String property) {

    if (json['damage_relations']?[property] == null) {
      return [];
    }

    return (json['damage_relations'][property] as List<dynamic>)
        .map((el) => PokemonType.fromJson(el))
        .toList();
  }

  factory PokemonType.fromJson(Map<String, dynamic> json) {
    String? typeName = json['name'] != null ? capitalize(json['name']) : null;
    return PokemonType(
      id: json['id'],
      type: json['name'],
      image: AssetImage('assets/images/Type_${typeName}_HOME.webp'),
      noDamageTo: mapDamageRelationToPokemonType(json, 'no_damage_to'),
      halfDamageTo: mapDamageRelationToPokemonType(json, 'half_damage_to'),
      doubleDamageTo: mapDamageRelationToPokemonType(json, 'double_damage_to'),
      noDamageFrom: mapDamageRelationToPokemonType(json, 'no_damage_from'),
      halfDamageFrom: mapDamageRelationToPokemonType(json, 'half_damage_from'),
      doubleDamageFrom: mapDamageRelationToPokemonType(json, 'double_damage_from'),
    );
  }
}
