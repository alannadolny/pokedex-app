import 'package:flutter/material.dart';

class FiltersButton extends StatefulWidget {
  const FiltersButton({
    super.key,
  });

  @override
  State<FiltersButton> createState() {
    return _FilterButton();
  }
}

class _FilterButton extends State<FiltersButton> {
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
          onPressed: () {},
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
