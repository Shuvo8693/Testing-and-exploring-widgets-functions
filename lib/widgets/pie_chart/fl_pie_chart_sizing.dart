import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FlPieChartSizing extends StatefulWidget {
  const FlPieChartSizing({super.key});

  @override
  State<FlPieChartSizing> createState() => _FlPieChartSizingState();
}

class _FlPieChartSizingState extends State<FlPieChartSizing> {
  static const _minThickness = 8.0;
  static const _maxThickness = 130.0;
  double thickness = _minThickness;
  bool fixedCenter = false;
  static const _fixedCenterRadius = 80.0;

  late double currentCenterSpace = _fixedCenterRadius;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Column(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  currentCenterSpace = max(
                      fixedCenter
                          ? _fixedCenterRadius
                          : constraints.biggest.shortestSide / 2 - thickness, 0) * 2;
                  return Stack(
                    children: [
                      PieChart(
                        PieChartData(
                          sections: [
                            PieChartSectionData(value: 10, radius: thickness),
                            PieChartSectionData(value: 20, radius: thickness),
                            PieChartSectionData(value: 30, radius: thickness),
                          ],
                          startDegreeOffset: 30,
                          centerSpaceRadius: currentCenterSpace / 2,
                        ),
                        swapAnimationDuration: const Duration(milliseconds: 0),
                      ),
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _MeasureLine(
                              text: thickness.toInt().toString(),
                              color: Colors.black.withOpacity(0.4),
                              value: thickness,
                            ),
                            _MeasureLine(
                              text: currentCenterSpace.toInt().toString(),
                              color: Colors.red.withOpacity(0.4),
                              value: currentCenterSpace,
                            ),
                            _MeasureLine(
                              text: thickness.toInt().toString(),
                              color: Colors.black.withOpacity(0.4),
                              value: thickness,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Slider(
              value: thickness,
              onChanged: (newValue) {
                setState(() {
                  thickness = newValue;
                });
              },
              min: _minThickness,
              max: _maxThickness,
              divisions: (_maxThickness - _minThickness).toInt(),
            ),
            SizedBox(
              width: 200,
              child: CheckboxListTile(
                title: const Text('Fixed center'),
                value: fixedCenter,
                onChanged: (newValue) {
                  setState(() {
                    fixedCenter = newValue!;
                  });
                },
              ),
            ),
            Text('thickness: ${thickness.toInt()}'),
          ],
        ),
      ),
    );
  }
}

class _MeasureLine extends StatelessWidget {
  const _MeasureLine({
    super.key,
    required this.text,
    required this.color,
    required this.value,
  });

  final String text;
  final Color color;
  final double value;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: value),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20,
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: value,
            height: 2,
            color: color,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}