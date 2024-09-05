import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/consts.dart';
import 'package:pokedex_app/provider.dart';

class Filters extends ConsumerWidget {
  const Filters({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FilterNotifier filters = ref.watch(filterProvider);

    List<Widget> mapOptionsToCheckboxes() {
      return ORDERING_OPTIONS.entries
          .map(
            (option) => Row(
              children: [
                Checkbox(
                  value: filters.isCurrentSortOrder(option.key),
                  onChanged: (isChecked) {
                    filters.updateSortOrder(option.key);
                  },
                ),
                Text(option.value),
              ],
            ),
          )
          .toList();
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 15)),
          const Text(
            "Select ordering:",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          ...mapOptionsToCheckboxes(),
        ],
      ),
    );
  }
}
