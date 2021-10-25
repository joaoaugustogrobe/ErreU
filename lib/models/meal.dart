import 'package:erreu/models/dish.dart';


enum MealType {
  lunch,
  dinner,
}

class Meal {
  late MealType type;
  late DateTime day;
  late Dish dish;

  Meal({
    required this.type,
    required this.day,
    required this.dish,
  });
}