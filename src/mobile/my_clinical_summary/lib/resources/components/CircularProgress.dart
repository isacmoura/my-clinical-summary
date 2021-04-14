import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress();

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
    );
  }
}
