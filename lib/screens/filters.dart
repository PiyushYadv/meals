import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_providers.dart';
//import 'package:meals/screens/tabs.dart';
//import 'package:meals/widgets/main_drawer.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    Widget buildListTile({
      required String text,
      required bool isActive,
      required Filter filter,
    }) {
      return SwitchListTile(
        value: isActive,
        onChanged: (value) {
          ref.read(filtersProvider.notifier).setFilter(filter, value);
        },
        title: Text(
          text,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        subtitle: Text(
          'Only include ${text.toLowerCase()} meals.',
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        activeColor: Theme.of(context).colorScheme.tertiary,
        contentPadding: const EdgeInsets.only(
          left: 34,
          right: 22,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.pop(context);
      //     if (identifier == 'meals') {
      //       Navigator.pushReplacement(
      //         context,
      //         MaterialPageRoute(
      //           builder: (ctx) => const TabsScreen(),
      //         ),
      //       );
      //     }
      //   },
      // ),
      body: Column(
        children: [
          buildListTile(
            text: 'Gluten-free',
            filter: Filter.glutenFree,
            isActive: activeFilters[Filter.glutenFree]!,
          ),
          buildListTile(
            text: 'Lactose-free',
            filter: Filter.lactoseFree,
            isActive: activeFilters[Filter.lactoseFree]!,
          ),
          buildListTile(
            text: 'Vegetarian',
            filter: Filter.vegetarian,
            isActive: activeFilters[Filter.vegetarian]!,
          ),
          buildListTile(
            text: 'Vegan',
            filter: Filter.vegan,
            isActive: activeFilters[Filter.vegan]!,
          ),
        ],
      ),
    );
  }
}
