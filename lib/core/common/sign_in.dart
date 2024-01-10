import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interactopia/core/constants/constants.dart';
import 'package:interactopia/features/auth/controller/auth_controller.dart';
import 'package:interactopia/theme/palette.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({super.key});

  void signInWithGoogle(BuildContext context, WidgetRef ref) {
    ref.read(authControllerProvider.notifier).signInWithGoogle(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 400,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: ElevatedButton.icon(
            onPressed: () => signInWithGoogle(context, ref),
            icon: Image.asset(
              Constants.googlePath,
              width: 40,
            ),
            label: const Text(
              "Sign in through google",
              style: TextStyle(color: Pallete.whiteColor),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Pallete.darkGreenColor,
              shadowColor: Pallete.whiteColor,
              shape:
                  const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            )),
      ),
    );
  }
}
