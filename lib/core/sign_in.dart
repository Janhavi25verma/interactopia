import 'package:flutter/material.dart';
import 'package:interactopia/core/constants.dart';
import 'package:interactopia/theme/palette.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Image.asset(
            Constants.googlePath,
            width: 40,
          ),
          label: const Text(
            "Sign in through google",
            style: TextStyle(color: Pallete.whiteColor),
          ),
        style:
        ElevatedButton.styleFrom(
        backgroundColor: Pallete.darkGreenColor,
        shadowColor: Pallete.whiteColor,
        shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero),
        )),
      ),
    );
  }
}
