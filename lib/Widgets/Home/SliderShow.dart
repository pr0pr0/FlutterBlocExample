import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/Bloc/HomeBloc/HomeBloc.dart';
import 'package:foodapp/Helper/Constants/MyColors.dart';
import 'package:foodapp/Widgets/Home/CardSliderShow.dart';

class SliderShow extends StatelessWidget {
  const SliderShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1,
                aspectRatio: 2,
                autoPlayInterval: const Duration(seconds: 5),
                onPageChanged: (index, reason) {
                  context.read<HomeBloc>().add(ShowIndexEvent(index));
                },
                scrollPhysics: const BouncingScrollPhysics(),
              ),
              items: getListWidget(),
            ),
            Positioned(
              bottom: 20,
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _slideShow.asMap().entries.map((entry) {
                  return BlocBuilder<HomeBloc, HomeState>(
                    buildWhen: (previous, current) {
                      if (previous.showIndex != current.showIndex) {
                        return previous.showIndex == entry.key ||
                            current.showIndex == entry.key;
                      }
                      return false;
                    },
                    builder: (context, state) {
                      return Container(
                        width: state.showIndex == entry.key ? 20 : 10,
                        height: 10,
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(10),
                            color: state.showIndex == entry.key
                                ? MyColors.greenLight
                                : MyColors.white),
                      );
                    },
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ],
    );
  }
}

List<String> _slideShow = [
  'assets/Images/0.jpg',
  'assets/Images/1.jpg',
  'assets/Images/2.jpg',
  'assets/Images/3.jpg',
  'assets/Images/4.jpg'
];

List<Widget> getListWidget() {
  List<Widget> listWidget = [];
  for (int index = 0; index < _slideColorShow.length; index++) {
    listWidget.add(
      CardSliderShow(
        image: _slideShow[index],
        myColors: _slideColorShow[index],
      ),
    );
  }

  return listWidget;
}

List<Color> _slideColorShow = [
  MyColors.menu,
  MyColors.backgroundColor,
  MyColors.textGrey,
  MyColors.textBlack,
  MyColors.textLightGrey,
];
