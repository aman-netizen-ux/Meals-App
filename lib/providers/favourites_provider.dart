import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavMealsNotifier extends StateNotifier<List<Meal>>{
  FavMealsNotifier() : super([]);

  //We are not allowed to edit and existing value in memory, we always have to create a new one in case of State Notifier
  bool toggleMealfavoriteStatus(Meal meal){
    final mealIsFav = state.contains(meal);

    if(mealIsFav){
      //removing the meal if its already in favs
      //can't work with .add or .remove because it won't work with state notifier
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    }else{
      state = [...state, meal];
      return true;
    } 
  }
}

final favMealsProvider = StateNotifierProvider<FavMealsNotifier, List<Meal>>((ref) {
  //This provider will return the instance of our notifier class
  // So that we have the class for editing as well fetching state
  return FavMealsNotifier();
});