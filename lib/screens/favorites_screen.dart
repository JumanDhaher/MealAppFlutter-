import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
class Favorites extends StatelessWidget {
  final List<Meal> favoritedMeals;
  Favorites(this.favoritedMeals);
  @override
  Widget build(BuildContext context) {
    if(favoritedMeals.isEmpty){
       return Center(child: Text('You have no favorites yet - start adding some!'));
    }
    return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: favoritedMeals[index].id,
              title: favoritedMeals[index].title,
              imageUrl: favoritedMeals[index].imageUrl,
              complexity: favoritedMeals[index].complexity,
              affordabilty: favoritedMeals[index].affordability,
              duration: favoritedMeals[index].duration,
            );
          },
          itemCount: favoritedMeals.length,
        );
    }
}