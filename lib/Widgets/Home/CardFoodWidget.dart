import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/Bloc/HomeBloc/HomeBloc.dart';
import 'package:foodapp/Data/Model/FoodModel/FoodModel.dart';

class CardFoodWidget extends StatelessWidget {
  final FoodModel food;
  final int index;
  const CardFoodWidget({super.key, required this.food, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => context.read<HomeBloc>().add(SelectFood(index)),
        child: BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) {
            if (previous.selectFoodIndex != current.selectFoodIndex) {
              return previous.selectFoodIndex == index ||
                  current.selectFoodIndex == index;
            }
            return false;
          },
          builder: (context, state) {
        
            return Card(
              color: state.selectFoodIndex == index
                  ? Colors.blueAccent
                  : Colors.cyanAccent,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text("Country: ${food.country}"),
                    Text("Total Time: ${food.totalTime}"),
                    Text("Total Deaths: ${food.name}"),
                    Text("Total Recovered: ${food.description}"),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
