import 'package:flutter/material.dart';

class ListHeader extends StatelessWidget {
  const ListHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 10,
        bottom: 20,
        right: 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pokédex',
            style: TextStyle(fontSize: 55, fontWeight: FontWeight.w900),
          ),
          Text(
            'Search for a pokemon by name or using its National Pokédex number.',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
