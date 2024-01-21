import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  String errorText;

  ErrorText({
    super.key,
    required this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorText),
    );
  }
}
