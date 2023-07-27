import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const FirstPage();
              },
            ),
          );
        },
      ),
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Container(
        width: 100,
        height: 50,
        color: Colors.red,
        child: const SizedBox(
          width: 150,
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      appBar: AppBar(
        title: const Text('FirstPage'),
      ),
      body: Container(
        width: 100,
        height: 50,
        color: Colors.red,
        child: const SizedBox(
          width: 150,
        ),
      ),
    );
  }
}
