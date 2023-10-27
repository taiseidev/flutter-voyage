import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:just_audio/just_audio.dart';

class LoadingSample extends StatefulWidget {
  const LoadingSample({super.key});

  @override
  State<LoadingSample> createState() => _LoadingSampleState();
}

class _LoadingSampleState extends State<LoadingSample> {
  final _player = AudioPlayer();
  late final Duration? duration;

  @override
  void initState() {
    super.initState();
    Future(() async {
      duration = await _player.setUrl(
        'https://foo.com/bar.mp3',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SpinKitPumpingHeart(
              color: Colors.pink,
              size: 50.0,
              duration: Duration(milliseconds: 500),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("音源再生"),
            ),
          ],
        ),
      ),
    );
  }
}
