import 'package:flutter/material.dart';
import 'package:pokedex_app/consts.dart';
import 'package:pokedex_app/models/debouncer.dart';

class SearchField extends StatelessWidget {
  final String? placeholder;
  final Function onTextEnter;
  final Debouncer debouncer;

  SearchField({
    required this.onTextEnter,
    this.placeholder,
    super.key,
  }) : debouncer = Debouncer(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        debouncer.run(() {
          onTextEnter(value);
        });
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: DEFAULT_LIGHT_COLOR,
        hintText: placeholder,
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
