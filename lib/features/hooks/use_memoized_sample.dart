import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseMemoizedSample extends HookWidget {
  UseMemoizedSample({super.key});

  final dd = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final counter = useState<int>(0);
    final counter1 = useState<int>(0);
    final now = useMemoized(
      () => DateTime.now(),
      [counter1.value],
    );

    useEffect(() {
      print('useEffect');
      return () => print('発火');
    }, [counter.value]);

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  dd.toString(),
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  now.toString(),
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  counter.value.toString(),
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  counter1.value.toString(),
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () => counter.value++, // カウンターが増えWidgetのビルドが走る
                child: const Icon(Icons.add),
              ),
              Builder(
                builder: (context) => FloatingActionButton(
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: const Text('Yay! A SnackBar!'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }, // カウンターが増えWidgetのビルドが走る
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ));
  }
}
