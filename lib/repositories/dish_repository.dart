import 'package:erreu/models/dish.dart';

class DishRepository {
  static List<Dish> dishList = [
    Dish(
      name: 'Yakisoba',
      description: 'A quick and spicy meal. I really don\'t like a lot of the flavors from the Maruchan Yakisoba',
      url: 'https://miro.medium.com/max/1000/0*ZrkC2g7ETZnbUm8h',
    ),
    Dish(
      name: 'Almondegas',
      description: 'Almondegas e macarronada ao molho bolonhesa.',
      url: 'https://images.unsplash.com/photo-1515516969-d4008cc6241a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8ZGlubmVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    ),
    Dish(
      name: 'Camarão e arroz',
      description: 'lorem ipsun',
      url: 'https://images.unsplash.com/photo-1564671165093-20688ff1fffa?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1598&q=80',
    ),
    Dish(
      name: 'Bife ao molho Madeira',
      description: 'Uma incrível combinação...',
      url: 'https://as2.ftcdn.net/v2/jpg/04/50/56/99/500_F_450569925_i7xqoKxWFOX1iwodgYOMyMBVDIhiljxs.jpg',
    )
  ];
}