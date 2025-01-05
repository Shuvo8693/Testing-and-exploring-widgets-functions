import 'package:flutter/material.dart';
import 'package:testing_and_exploring_widgets/core/size/nothing.dart';

class AspectRatioTest extends StatefulWidget {
  const AspectRatioTest({super.key});

  @override
  State<AspectRatioTest> createState() => _AspectRatioTestState();
}

class _AspectRatioTestState extends State<AspectRatioTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: AspectRatio(
              aspectRatio: 16 / 10,
              child: Container(
                color: Colors.teal,
                child:  const Center(
                    child: Text('Allahu Akber',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
