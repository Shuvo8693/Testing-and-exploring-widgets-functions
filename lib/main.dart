import 'package:flutter/material.dart';
import 'package:testing_and_exploring_widgets/widgets/nested_scrolling_under_singleChildScroll/ScrollSyncPage1.dart';
import 'package:testing_and_exploring_widgets/widgets/nested_scrolling_under_singleChildScroll/ScrollSyncPage2.dart';


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
      home:  ScrollSyncPage2(),
    );
  }
}


