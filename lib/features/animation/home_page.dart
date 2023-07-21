import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late TweenSequence<Alignment> alignTween;
  late Tween<double> rotateTween;
  final curve = Curves.linear;
  late Animation<Alignment> alignAnimation;
  late Animation<double> rotateAnimation;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    alignTween = TweenSequence<Alignment>([
      TweenSequenceItem(
          tween: Tween(begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1 // <<< この例ではDurationが4秒なので、weight:1 = 1秒となる
          ),
      TweenSequenceItem(
        tween: Tween(begin: Alignment.topRight, end: Alignment.bottomRight),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: Alignment.bottomRight, end: Alignment.bottomLeft),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: Alignment.bottomLeft, end: Alignment.topLeft),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: Alignment.topLeft, end: Alignment.center),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: Alignment.center, end: Alignment.bottomRight),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: Alignment.bottomRight, end: Alignment.bottomLeft),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: Alignment.bottomLeft, end: Alignment.topLeft),
        weight: 1,
      ),
    ]);
    rotateTween = Tween(begin: 0, end: 8 * pi);
    alignTween.chain(CurveTween(curve: curve));
    alignAnimation = controller.drive(alignTween);
    rotateAnimation = controller.drive(rotateTween);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: AnimatedBuilder(
                animation: alignAnimation,
                builder: (context, _) {
                  return Align(
                    alignment: alignAnimation.value,
                    child: Transform.rotate(
                      angle: rotateAnimation.value,
                      child: const Text('Hello world!'),
                    ),
                  );
                }),
          ),
          AnimatingText(
            animation: alignAnimation,
          ),
          AnimatingText(
            animation: alignAnimation,
          ),
          AnimatingText(
            animation: alignAnimation,
          ),
          AnimatingText(
            animation: alignAnimation,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.repeat();
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
