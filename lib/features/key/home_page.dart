import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final _globalKey = GlobalKey<_CustomTextState>();

  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              key: _globalKey,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _globalKey.currentState!.customPrint();
        },
      ),
    );
  }
}

class CustomText extends StatefulWidget {
  const CustomText({super.key});

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  String text = 'テスト';
  void customPrint() {
    setState(() {
      text = '変更';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
