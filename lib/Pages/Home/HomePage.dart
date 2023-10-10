import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/Bloc/HomeBloc/HomeBloc.dart';
import 'package:foodapp/Widgets/Home/CardFoodWidget.dart';
import 'package:foodapp/Widgets/Home/SliderShow.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(const GetFoodList());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 250,
              child: SliderShow(),
            ),
            BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (previous, current) =>
                  previous.foods.length != current.foods.length ||
                  previous.status != current.status,
              builder: (context, state) {
                switch (state.status) {
                  case HomeStatus.loading:
                    return _buildLoading();
                  case HomeStatus.success:
                    return _buildCard(context, state.foods);
                  case HomeStatus.error:
                    return Center(
                      child: Text(state.error!),
                    );

                  default:
                    return const SizedBox();
                }
              },
            ),
          ],
        ));
  }
}

Color getRandomColor() {
  final random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}

Widget _buildCard(
  BuildContext context,
  List<dynamic> foods,
) {
  return Expanded(
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: foods.length,
      itemBuilder: (context, index) {
        return CardFoodWidget(
          food: foods[index],
          index: index,
        );
      },
    ),
  );
}

Widget _buildLoading() => Center(child: CircularProgressIndicator());
