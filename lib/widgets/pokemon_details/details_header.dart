import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_app/consts.dart';
import 'package:pokedex_app/provider.dart';

class DetailsHeader extends ConsumerWidget {
  final String name;
  final String id;

  const DetailsHeader({
    required this.name,
    required this.id,
    super.key,
  });


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FilterNotifier filters = ref.watch(filterProvider);
    final PagingNotifier pagingController = ref.watch(pagingProvider);

    void onBackArrowTap() {
      filters.updatePageKey(DEFAULT_PAGE_KEY);
      pagingController.resetController();
        context.goNamed(
          'pokemonList',
        );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onBackArrowTap,
          child: const Icon(Icons.arrow_back),
        ),
        Column(
          children: [
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            Text(
              id,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
          ],
        ),
        const SizedBox(),
      ],
    );
  }
}
