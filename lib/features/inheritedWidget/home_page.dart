import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedCounter(
      count: _count,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: _increment,
          child: const Icon(Icons.add),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetA(),
              WidgetB(),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetA extends StatelessWidget {
  const WidgetA({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      _InheritedCounter.of(context, listen: true)!.count.toString(),
    );
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      _InheritedCounter.of(context, listen: false)!.count.toString(),
    );
  }
}

class _InheritedCounter extends InheritedWidget {
  const _InheritedCounter({
    Key? key,
    required Widget child,
    required this.count,
  }) : super(key: key, child: child);

  // 下位ツリーがアクセスするフィールド
  final int count;

  // フィールドの変更内容によって通知を制限する
  @override
  bool updateShouldNotify(_InheritedCounter old) => true;

  static _InheritedCounter? of(BuildContext context, {required bool listen}) {
    return listen
        ? context.dependOnInheritedWidgetOfExactType<_InheritedCounter>()
        : context
            .getElementForInheritedWidgetOfExactType<_InheritedCounter>()
            ?.widget as _InheritedCounter;
  }
}
