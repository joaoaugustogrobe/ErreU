import 'package:erreu/models/meal.dart';
import 'package:flutter/material.dart';

class NextMeal extends StatelessWidget {
  const NextMeal({Key? key, required this.meal}) : super(key: key);
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(children: <Widget>[
          Container(
            color: Colors.black12,
            width: double.infinity,
            height: 350,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                meal.dish.url,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
        ]),
        const SizedBox(
          height: 12,
        ),
        Text(meal.dish.name, style: textTheme.headline6!.copyWith(
          fontSize: 18
        )),
        Text(meal.dish.description, style: textTheme.subtitle2!.copyWith(
          color: const Color(0xFF3C3C43),
          fontSize: 13
        ))
      ],
    );
  }
}
