import 'package:flutter/material.dart';

import '../../constants/assets.dart';
import '../../constants/constants.dart';

class LoginImageWidget extends StatelessWidget {
  const LoginImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        Assets.loginImageSecond,
        width: Constants.loginImageSize,
        height: Constants.loginImageSize,
      ),
    );
  }
}
