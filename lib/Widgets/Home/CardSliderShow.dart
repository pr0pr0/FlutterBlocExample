import 'package:flutter/material.dart';

import '../../Helper/Constants/MyColors.dart';

class CardSliderShow extends StatelessWidget {
  final String image;
  final Color myColors;

  const CardSliderShow(
      {super.key, required this.image, required this.myColors});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 10),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            color: Color.fromRGBO(165, 208, 205, 1),
            offset: Offset(0, 3),
          ),
          BoxShadow(
            color: MyColors.backgroundColor,
            offset: Offset(-3, 0),
          ),
          BoxShadow(
            color: MyColors.backgroundColor,
            offset: Offset(3, 0),
          )
        ],
        borderRadius: BorderRadius.circular(24),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            /*
          Image(
            image: AssetImage(image),
            height: 180,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          */
            Container(
              color: myColors,
            ),
          ],
        ),
      ),
    );
  }
}
