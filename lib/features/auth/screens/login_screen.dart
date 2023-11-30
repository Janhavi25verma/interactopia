import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interactopia/core/constants.dart';
import 'package:interactopia/theme/palette.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var logoText = Text(
      "INTERACTOPIA",
      style: GoogleFonts.smoochSans(
        textStyle: const TextStyle(
            letterSpacing: 4.5, fontWeight: FontWeight.w500, fontSize: 30),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: logoText,
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text(
                "Skip >",
                style: TextStyle(
                    fontWeight: FontWeight.w300, color: Pallete.greyGreenColor),
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            //HEADING
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                "Login",
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            //EMAIL TEXTFIELD
            SizedBox(
              width: 400,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      hintText: "Email",
                      filled: true,
                      fillColor: Pallete.greyGreenColor,
                      border: UnderlineInputBorder()),
                ),
              ),
            ),
            SizedBox(
              width: 400,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      hintText: "Password",
                      filled: true,
                      fillColor: Pallete.greyGreenColor,
                      border: UnderlineInputBorder()),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Pallete.darkGreenColor)),
              child: const Text(
                "Login",
                style: TextStyle(color: Pallete.whiteColor),
              ),
            )
          ],
        ));
  }
}
