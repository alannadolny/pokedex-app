import 'package:flutter/material.dart';
import 'package:pokedex_app/widgets/pokemon_list/filters_button/filters.dart';

class FiltersButton extends StatelessWidget {
  const FiltersButton({
    super.key,
  });

  Null Function() openFiltersModal(BuildContext context) {
    return () {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => const Filters(),
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
      ),
      child: SizedBox(
        height: 63,
        width: 70,
        child: IconButton.filled(
          onPressed: openFiltersModal(context),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
          ),
          icon: const Icon(
            Icons.tune,
            size: 30,
          ),
        ),
      ),
    );
  }
}
