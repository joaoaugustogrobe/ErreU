import 'package:erreu/models/meal.dart';
import 'package:erreu/models/week_day.dart';
import 'package:flutter/material.dart';

class HorizontalMealList extends StatelessWidget {
  const HorizontalMealList({Key? key, required this.mealList})
      : super(key: key);

  final List<Meal> mealList;
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return LimitedBox(
      maxHeight: 300,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          Meal meal = mealList[index];
          return SizedBox(
              width: 200,
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.black12,
                    width: double.infinity,
                    height: 130,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        meal.dish.url,
                        alignment: Alignment.center,
                        fit: BoxFit.cover
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(meal.dish.name,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.headline6!.copyWith(fontSize: 18)),
                  Text(meal.dish.description,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.subtitle2!.copyWith(
                          color: const Color(0xFF3C3C43), fontSize: 13)),
                  Text(
                      (meal.type == MealType.lunch
                              ? 'Almoço de '
                              : 'Janta de ') +
                          WeekDay.days[meal.day.weekday],
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.subtitle2!.copyWith(
                          color: const Color(0xFF3C3C43), fontSize: 13)),
                ],
              ));
        },
        separatorBuilder: (_, ___) => const SizedBox(width: 10),
        itemCount: mealList.length,
      ),
    );
  }
}
