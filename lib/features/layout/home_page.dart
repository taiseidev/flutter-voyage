import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const buttonTitles = [
    'ストリーミング\nプラットフォーム',
    '友達や家族からのおすすめ',
    'ソーシャルメディアの広告',
    'App Store',
    'ポッドキャスト / メディア',
    'セラピスト / 医療従事者',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const MyGridView(),
          const Positioned.fill(
            child: ColoredBox(color: Colors.transparent),
          ),
          DefaultTextStyle(
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: DefaultTextStyle.merge(
                  style: const TextStyle(fontSize: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const _Description(),
                      const Gap(32),
                      ...buttonTitles
                          .map(
                            (title) => _CustomButton(title),
                          )
                          .toList(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Endelを知った\nきっかけは？',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 24),
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          debugPrint('タップされました：$text');
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 1000,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, // 横方向の項目数
        childAspectRatio: 1.0, // 項目の縦横比
        crossAxisSpacing: 4.0, // 項目間の横方向のスペース
        mainAxisSpacing: 4.0, // 項目間の縦方向のスペース
      ),
      itemBuilder: (BuildContext context, int index) {
        return GridTile(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 0.5), // ボーダーを白色に設定
            ),
          ),
        );
      },
    );
  }
}
