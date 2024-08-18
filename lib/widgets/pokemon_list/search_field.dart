import 'package:flutter/material.dart';
import 'package:pokedex_app/consts.dart';

class SearchField extends StatefulWidget {
  String? placeholder;

  SearchField({
    super.key,
    this.placeholder,
  });

  @override
  State<SearchField> createState() {
    return _SearchFieldState();
  }
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: DEFAULT_LIGHT_COLOR,
        hintText: widget.placeholder,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
    );
  }
}
