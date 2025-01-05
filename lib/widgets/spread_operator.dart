
import 'dart:developer';

import 'package:flutter/material.dart';

class SpreadOperator extends StatelessWidget {
  const SpreadOperator({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> a= [0,1,2,3,4];
    List<int> b= [6,7,8,9];
    List<int>? c;
    List<int> result= [...a,5,...b,...?c];
    log(result.toString());
    return Scaffold(
      body: Center(
        child: Text(result.toString()),
      ),
    );
  }

}
