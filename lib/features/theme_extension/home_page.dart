import 'package:flutter/material.dart';
import 'package:flutter_voyage/features/theme_extension/square.dart';
import 'package:flutter_voyage/features/theme_extension/square_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Square(
              style: SquareStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
