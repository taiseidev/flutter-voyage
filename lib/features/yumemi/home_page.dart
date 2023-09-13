import 'package:flutter/material.dart';

// ゆめみ社の研修を試す場所
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FlexibleSample(),
    );
  }
}

class FlexibleSample extends StatelessWidget {
  const FlexibleSample({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width * 0.8,
            height: size.height * 0.5,
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    color: Colors.red,
                  ),
                ),
                Flexible(
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
