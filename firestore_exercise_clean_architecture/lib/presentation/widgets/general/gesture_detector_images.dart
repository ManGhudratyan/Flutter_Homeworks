import 'package:flutter/material.dart';

import '../../constants/assets.dart';
import '../../constants/constants.dart';

class GestureDetectorImages extends StatelessWidget {
  const GestureDetectorImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          'Sign up with',
          style: TextStyle(fontSize: 18),
        ),
        GestureDetector(
          onTap: () {},
          child: Image.asset(
            Assets.googleImage,
            width: Constants.socialImageWidth,
            height: Constants.socialImageHeight,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Image.asset(
            Assets.facebookImage,
            width: Constants.socialImageWidth,
            height: Constants.socialImageHeight,
          ),
        ),
      ],
    );
  }
}
