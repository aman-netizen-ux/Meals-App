//Instantiating tbis provider class can create a provider object for our use
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';


final mealsProvider = Provider(
  (ref) {
    return dummyMeals;
  },
);