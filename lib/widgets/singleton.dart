import 'package:flutter/material.dart';

class SingleTon{
 static final SingleTon _instance= SingleTon._internal();

  factory SingleTon.singleTon(){
    return _instance;
  }

  SingleTon._internal();

 String  message = 'লাইলাহা ইল্লাল্লাহু মুহাম্মাদান রাসুরুল্লাহ';
  String  message2 = 'Allahu-Akber';
}

class NormalClass{
  String  message = 'লাইলাহা ইল্লাল্লাহু মুহাম্মাদান রাসুরুল্লাহ';

}

class SingletonTest extends StatefulWidget {
  const SingletonTest({super.key});

  @override
  State<SingletonTest> createState() => _SingletonTestState();
}

class _SingletonTestState extends State<SingletonTest> {

final SingleTon _singleTon = SingleTon.singleTon();
final SingleTon _singleTon2 = SingleTon.singleTon();
final NormalClass _normalClass =NormalClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(_normalClass.message),
          Text(_singleTon.message2),
          Text(_singleTon2.message),
        ],),
      ),
    );
  }
}
