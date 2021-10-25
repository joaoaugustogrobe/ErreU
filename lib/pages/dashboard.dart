import 'package:erreu/components/horizontal_meal_list.dart';
import 'package:erreu/components/next_meal.dart';
import 'package:erreu/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:erreu/repositories/meal_repository.dart';

import 'login.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    final mealList = MealRepository.mealList;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 60,
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Olá, João", style: textTheme.headline5),
                      Text("Com fome de RU ?", style: textTheme.subtitle1),
                    ],
                  ),
                  IconButton(
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Login(),
                        ),
                      )
                    },
                    icon: const Icon(Icons.person, color: Colors.black),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text('Agora no almoço', style: textTheme.headline6),
              const SizedBox(height: 8),
              NextMeal(meal: mealList[0]),
              const SizedBox(height: 24),
              Text("Próximas refeições", style: textTheme.headline6),
              const SizedBox(height: 8),
              HorizontalMealList(mealList: mealList)
            ],
          ),
        ),
      ),
    );
  }
}
