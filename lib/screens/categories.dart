import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onTogglefav, required this.availableMeals});

  final void Function(Meal meal) onTogglefav;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    //To check whether the categories list in that specific meal contains the id of the category which is selected or not
    //If not, then it'll not add that meal to the list;
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    debugPrint("filteredMeals: $filteredMeals");
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
          onToggleFavs: onTogglefav,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(14),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: // [
            availableCategories
                .map(
                  (category) => CategoryGridItem(
                    category: category,
                    onSelectCategory: () {
                      _selectCategory(context, category);
                    },
                  ),
                )
                .toList()
        // for(final category in availableCategories)
        //   CategoryGridItem(category: category)
        //],
        );
  }
}
