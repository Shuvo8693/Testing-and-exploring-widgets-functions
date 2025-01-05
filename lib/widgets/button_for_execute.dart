import 'package:flutter/material.dart';

class ButtonForExecute extends StatefulWidget {
  const ButtonForExecute({super.key});

  @override
  State<ButtonForExecute> createState() => _ButtonForExecuteState();
}

class _ButtonForExecuteState extends State<ButtonForExecute> {
  int n = 10;

  _function() {
    n;
    while (n != 0) {
      for (int i = 0; i < n; i++) {
        print('$n:Allahu akber'); // print 55 times
      }
      n--; // Decrease n by 1 each time
    }
  }

  _factorialFunction() {
    int n = 5;
    int result = 2;
    while (n > 0) {
      result *= n; // Multiply the result by n
      n--; // Decrease n by 1
    }
    print('Factorial: $result');
  }

  _breakInfiniteLoopFunction() {
    int n = 0;
    while (true) {
      n++;
      print('Current number: $n');
      if (n == 5) {
        print('Break the loop');
        break ;
      }
    }
  } _negativeInfiniteLoopFunction() {
    int n = -1;
    while(n != 0) {
      for(int i = 0; i < n; i++) {
        print("hi"); // negative value not implement the loop
      }
      n--;  // Decrement n by -1 each time
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              //_function();
              //_factorialFunction();
              //_breakInfiniteLoopFunction();
              _negativeInfiniteLoopFunction();
            },
            child: const Text('Action'),
          ),
        ),
      ),
    );
  }
}
