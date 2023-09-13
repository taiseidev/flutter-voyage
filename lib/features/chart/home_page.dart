import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: 200,
          child: EthicalActionChart(),
        ),
      ),
    );
  }
}

// エシカルアクションで使用するカスタムコンポーネント
class EthicalActionChart extends StatelessWidget {
  const EthicalActionChart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        _BarChart(),
        _LineChart(isShowingMainData: true),
      ],
    );
  }
}

// 棒グラフのコンポーネント
class _BarChart extends StatelessWidget {
  const _BarChart();

  @override
  Widget build(BuildContext context) {
    return BarChart(barChartData);
  }

  get barChartData => BarChartData(
        maxY: 2,
        minY: 0,
        barGroups: getBarGroups(),
        borderData: borderData,
        gridData: gridData,
        titlesData: titlesData,
      );

  get gridData => const FlGridData(show: false);

  get titlesData => FlTitlesData(
        leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(sideTitles: bottomTitles),
      );
}

get bottomTitles => const SideTitles(
      showTitles: true,
      reservedSize: 32,
      interval: 1,
      getTitlesWidget: bottomTitleWidgets,
    );

Widget bottomTitleWidgets(double value, TitleMeta meta) => SideTitleWidget(
      axisSide: meta.axisSide,
      space: 2,
      child: const Text(''),
    );

get borderData => FlBorderData(show: false);

List<BarChartGroupData> getBarGroups() {
  // BarChartRodData(
  //   color: const Color(0xff698996),
  //   toY: 1.0,
  //   width: 20,
  //   borderRadius: const BorderRadius.only(
  //     topLeft: Radius.circular(5),
  //     topRight: Radius.circular(5),
  //   ),
  // );
  final actualDataBars = List.generate(
      7,
      (index) => BarChartRodData(
            color: const Color(0xffED583F).withOpacity(0.7),
            toY: 0.85,
            width: 20,
            borderSide: const BorderSide(color: Color(0xffED583F), width: 2),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
          ));

  List<BarChartRodData> barsWithSpacing = [];

  barsWithSpacing.add(
    BarChartRodData(
      color: Colors.transparent,
      toY: 0,
      width: 35,
    ),
  );

  // Add actual data bars followed by transparent spacing bars
  for (BarChartRodData dataBar in actualDataBars) {
    barsWithSpacing.add(dataBar);
    barsWithSpacing.add(BarChartRodData(
      color: Colors.white,
      toY: 0,
      width: 0.1,
    ));
  }

  // If there's any remaining space, fill it with transparent bars to keep everything left-aligned
  while (barsWithSpacing.length < 24) {
    barsWithSpacing.add(
      BarChartRodData(
        color: Colors.transparent,
        toY: 0,
        width: 5,
      ),
    );
  }

  return [
    BarChartGroupData(
      x: 1,
      barRods: barsWithSpacing,
    ),
  ];
}

class _LineChart extends StatelessWidget {
  const _LineChart({required this.isShowingMainData});

  final bool isShowingMainData;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData1,
      duration: const Duration(seconds: 2),
    );
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: 0,
        maxX: 14,
        maxY: 2,
        minY: 0,
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: const Color(0xff698996),
          getTooltipItems: (List<LineBarSpot> touchedSpots) {
            return touchedSpots.map((barSpot) {
              return const LineTooltipItem(
                '解析中',
                TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              );
            }).toList();
          },
        ),
        touchCallback: (event, response) {},
        getTouchedSpotIndicator:
            (LineChartBarData barData, List<int> spotIndexes) {
          return spotIndexes.map((spotIndex) {
            // final FlSpot spot = barData.spots[spotIndex];
            // if (spot.x == 7 || spot.x == 6) {
            //   return null;
            // }
            return TouchedSpotIndicatorData(
              const FlLine(color: Colors.transparent, strokeWidth: 0),
              FlDotData(
                getDotPainter: (spot, percent, barData, index) =>
                    CustomFlDotCirclePainter(
                  innerDotRadius: 5,
                  innerDotColor: const Color(0xffDBA2AA),
                  outerDotRadius: 7,
                  outerDotStrokeWidth: 2,
                  outerDotStrokeColor: const Color(0xffDBA2AA),
                ),
              ),
            );
          }).toList();
        },
      );

  String padText(String text, int desiredLength) {
    int spacesToAdd = desiredLength - text.length;
    return text + ' ' * spacesToAdd;
  }

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
      ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff698996),
      fontWeight: FontWeight.w500,
      fontSize: 10,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '';
        break;
      case 1:
        text = '200kWh';
        break;
      case 2:
        text = '400kWh';
        break;
      default:
        return const SizedBox.shrink();
    }
    switch (value.toInt()) {
      case 0:
        text = '';
        break;
      case 1:
        text = '200kWh';
        break;
      case 2:
        text = '400kWh';
        break;
      default:
        return const SizedBox.shrink();
    }

    return DottedLineTitle(text: text, style: style, index: value.toInt());
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 60,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff698996),
      fontWeight: FontWeight.w700,
      fontSize: 10,
    );
    Widget text;
    if (value >= 1 && value <= 13) {
      // 12のときだけ「月」を追加
      text = value == 13
          ? const Text('（月）', style: style)
          : Text('${value.toInt()}', style: style);
    } else {
      text = const Text('');
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 2,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => FlGridData(
        show: true,
        horizontalInterval: 0.5,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          if (value == 0.0) {
            return const FlLine(
              color: Colors.transparent,
              strokeWidth: 0,
            );
          }
          return const FlLine(
            color: Colors.transparent,
            strokeWidth: 0.5,
          );
        },
        drawVerticalLine: false,
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
        border: const Border(
          bottom: BorderSide(color: Colors.transparent),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: false,
        color: const Color(0xffDBA2AA),
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
          getDotPainter: (spot, percent, barData, index) =>
              CustomFlDotCirclePainter(
            innerDotRadius: 5,
            innerDotColor: const Color(0xffDBA2AA),
            outerDotRadius: 7,
            outerDotStrokeWidth: 2,
            outerDotStrokeColor: const Color(0xffDBA2AA),
          ),
        ),
        belowBarData: BarAreaData(show: false),
        spots: const [
          // 0.005 = 1kWh
          FlSpot(1, 1.1),
          FlSpot(2, 1.3),
          FlSpot(3, 0.8),
          FlSpot(4, 1.6),
          FlSpot(5, 0.9),
          FlSpot(6, 1.1),
          FlSpot(7, 1.4),
          FlSpot(8, 0.8),
        ],
      );
}

class CustomFlDotCirclePainter extends FlDotPainter {
  final double innerDotRadius;
  final Color innerDotColor;
  final double outerDotRadius;
  final double outerDotStrokeWidth;
  final Color outerDotStrokeColor;
  final List<double> monthsWithBorder;

  CustomFlDotCirclePainter({
    required this.innerDotRadius,
    required this.innerDotColor,
    required this.outerDotRadius,
    required this.outerDotStrokeWidth,
    required this.outerDotStrokeColor,
    this.monthsWithBorder = const [7.0], // 7月だけ枠線を追加
  });

  @override
  void draw(Canvas canvas, FlSpot spot, Offset offsetInCanvas) {
    if (monthsWithBorder.contains(spot.x)) {
      // 特定の月のみ外側の円を描画
      final outerRect =
          Rect.fromCircle(center: offsetInCanvas, radius: outerDotRadius);
      final outerPaint = Paint()
        ..color = outerDotStrokeColor
        ..strokeWidth = outerDotStrokeWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..strokeMiterLimit = 2
        ..isAntiAlias = true;
      canvas.drawOval(outerRect, outerPaint);
    }

    // 中心の円を常に描画
    final innerRect =
        Rect.fromCircle(center: offsetInCanvas, radius: innerDotRadius);
    final innerPaint = Paint()..color = innerDotColor;
    canvas.drawOval(innerRect, innerPaint);
  }

  @override
  Size getSize(FlSpot spot) {
    return Size(2 * outerDotRadius, 2 * outerDotRadius);
  }

  @override
  List<Object?> get props => [
        innerDotRadius,
        innerDotColor,
        outerDotRadius,
        outerDotStrokeWidth,
        outerDotStrokeColor,
        monthsWithBorder
      ];
}

class DottedLineTitle extends StatelessWidget {
  final String text;
  final TextStyle style;
  final int index;

  const DottedLineTitle({
    super.key,
    required this.text,
    required this.style,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(text, style: style),
        Padding(
          padding:
              EdgeInsets.only(left: 8, top: 2, bottom: index == 0 ? 14 : 0),
          child: CustomPaint(
            size: const Size(100, 4),
            painter:
                DottedLinePainter(MediaQuery.of(context).size.width, index),
          ),
        ),
      ],
    );
  }
}

class DottedLinePainter extends CustomPainter {
  final double screenWidth;
  final int index;

  DottedLinePainter(this.screenWidth, this.index);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xff698996)
      ..strokeWidth = index == 0 ? 2 : 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double gap = index == 0 ? 0.0 : 2.0;
    const double dotWidth = 2.0;
    const double paddingRight = 16.0;

    double startX = 0;
    while (startX + dotWidth + paddingRight <= screenWidth) {
      canvas.drawLine(Offset(startX, size.height / 2),
          Offset(startX + dotWidth, size.height / 2), paint);
      startX += gap + dotWidth;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
