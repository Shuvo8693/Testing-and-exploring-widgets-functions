import 'package:flutter/material.dart';
import 'package:testing_and_exploring_widgets/widgets/3d_arry/presentation/screen/3d_arry_screen.dart';
import 'package:testing_and_exploring_widgets/widgets/aspect_ratio.dart';
import 'package:testing_and_exploring_widgets/widgets/button_for_execute.dart';
import 'package:testing_and_exploring_widgets/widgets/liner_progress_bar.dart';
import 'package:testing_and_exploring_widgets/widgets/pie_chart/fl_pie_chart.dart';
import 'package:testing_and_exploring_widgets/widgets/form_field_validator_test.dart';
import 'package:testing_and_exploring_widgets/widgets/pie_chart/fl_pie_chart_sizing.dart';
import 'package:testing_and_exploring_widgets/widgets/singleton.dart';
import 'package:testing_and_exploring_widgets/widgets/spread_operator.dart';
import 'package:testing_and_exploring_widgets/widgets/tab_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home:  LinerProgressBar(),
    );
  }
}


