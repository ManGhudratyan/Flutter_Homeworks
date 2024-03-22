import 'package:flutter/material.dart';
import 'package:gyumri_guide/misc/colors.dart';
import 'package:gyumri_guide/widgets/app_text.dart';

// ignore: must_be_immutable
class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;

  ResponsiveButton({super.key, this.width = 120, this.isResponsive = false});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            if (isResponsive == true)
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: const AppText(
                  text: "Book a Trip",
                  colour: Colors.white,
                ),
              ),
            Expanded(
              child: Image.asset("img/button-one.png"),
            ),
          ],
        ),
      ),
    );
  }
}
