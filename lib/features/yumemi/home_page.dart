import 'package:flutter/material.dart';

// ゆめみ社の研修を試す場所
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.6,
              child: AspectRatio(
                aspectRatio: size.width / size.height,
                child: Container(
                  color: Colors.amber,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: FractionallySizedBox(
                      widthFactor: 0.5,
                      heightFactor: 0.5,
                      child: ColoredBox(
                        color: Colors.black,
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.red,
                                child: const Text("テストテストテストテスト"),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.blue,
                                child: const Text("テストテストテストテスト"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
