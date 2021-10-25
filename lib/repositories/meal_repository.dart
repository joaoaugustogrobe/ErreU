import 'package:erreu/models/meal.dart';
import 'package:erreu/models/dish.dart';
import 'package:erreu/repositories/dish_repository.dart';

List<Dish> dishList = DishRepository.dishList;


class MealRepository {
  static List<Meal> mealList = [
    Meal(
      type: MealType.lunch,
      day: DateTime.now(),
      dish: dishList[0],
    ),
    Meal(
      type: MealType.dinner,
      day: DateTime.now(),
      dish: dishList[1],
    ),
    Meal(
      type: MealType.lunch,
      day: DateTime.now(),
      dish: dishList[2],
    ),
    Meal(
      type: MealType.dinner,
      day: DateTime.now(),
      dish: dishList[3],
    )
  ];
}
