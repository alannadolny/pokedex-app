import 'package:flutter/material.dart';
import 'package:pokedex_app/widgets/pokemon_list/search_field.dart';
import 'package:pokedex_app/widgets/pokemon_list/filters_button.dart';

class ListHeader extends StatelessWidget {
  final Function onTextEnter;

  const ListHeader({
    required this.onTextEnter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        bottom: 20,
        right: 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pokédex',
            style: TextStyle(fontSize: 55, fontWeight: FontWeight.w900),
          ),
          const Text(
            'Search for a pokemon by name or using its National Pokédex number.',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: SearchField(
                  onTextEnter: onTextEnter,
                  placeholder: "Name or number",
                ),
              ),
              const FiltersButton(),
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
