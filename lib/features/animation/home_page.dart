import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double rotationFactor = 0.0;

  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Transform.rotate(
            angle: rotationFactor,
            child: const Icon(
              Icons.settings,
              size: 50,
            ),
          ),
          Positioned(
            top: 27,
            left: 27,
            child: Transform.rotate(
              angle: -rotationFactor,
              child: const Icon(
                Icons.settings,
                size: 50,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80),
            child: Row(
              children: [
                Expanded(
                  flex: 9,
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey, //色
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(1, 1),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (scrollNotification) {
                        if (scrollNotification is ScrollUpdateNotification) {
                          setState(() {
                            rotationFactor +=
                                scrollNotification.scrollDelta! / 100;
                          });
                        }
                        return true;
                      },
                      child: ListView.builder(
                        controller: controller,
                        itemCount: 200,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 100,
                            child:
                                Center(child: Text('List Item ${index + 1}')),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // controller.jumpTo(0);
          controller.animateTo(
            0,
            duration: const Duration(seconds: 1),
            curve: Curves.bounceIn,
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AnimatingText extends AnimatedWidget {
  const AnimatingText({
    super.key,
    required Animation<Alignment> animation,
  }) : super(listenable: animation);

  Animation<Alignment> get alignment => listenable as Animation<
      Alignment>; // <<< lisetenableに一度渡しgetterでアクセスしなければ引数animationにアクセス出来ない

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment.value, // <<< 直接引数のanimationを渡す事ができない
      child: const Text('こんにちは'),
    );
  }
}
