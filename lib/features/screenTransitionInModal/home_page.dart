import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 画面の高さを取得
    final screenHeight = MediaQuery.of(context).size.height;
    // 画面の高さの80%を計算
    final containerHeight = screenHeight * 0.6;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Modal Navigation'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open Modal'),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
                child: SizedBox(
                  height: containerHeight,
                  child: Navigator(
                    onGenerateRoute: (context) => MaterialPageRoute<ModalPage>(
                      builder: (context) => const ModalPage(),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ModalPage extends StatelessWidget {
  const ModalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
            icon: const Icon(Icons.clear),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondPage(),
                  ),
                );
              },
              child: const Text('次のページ'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('テキスト'),
          ],
        ),
      ),
    );
  }
}
