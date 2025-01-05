import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ValidatorTest extends StatefulWidget {
  const ValidatorTest({super.key});

  @override
  State<ValidatorTest> createState() => _ValidatorTestState();
}

class _ValidatorTestState extends State<ValidatorTest> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _phoneTEB = TextEditingController();
  final TextEditingController _emailTEB = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldKey ,
      drawer: const Drawer(
        backgroundColor: Colors.teal,
        width: 200,
        child: Column(
          children: [
            Text('Bismillah'),
            Text('Alhamdulillah'),
            Text('allahuAkber'),
            Text('Subahan Allah'),
            Text('Astagfirullah'),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Validator screen'),
        leading: GestureDetector(
          onTap: ()=> _scaffoldKey.currentState?.openDrawer(),
          child: const Icon(Icons.format_line_spacing),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.teal,
       height: 65,
       child: Center(
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
           IconButton(onPressed: (){}, icon: Icon(Icons.category)),
           IconButton(onPressed: (){}, icon: Icon(Icons.search)),
           IconButton(onPressed: (){}, icon: Icon(Icons.home)),
           IconButton(onPressed: (){}, icon: Icon(Icons.add_a_photo_outlined)),
           IconButton(onPressed: (){}, icon: Icon(Icons.person_outline_outlined)),
         ],),
       ),
      ),
      body: Center(
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailTEB,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                ),
                validator: (String? value) {
                  if (value!.trim().isEmpty) {
                    return 'The field is empty';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _phoneTEB,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10)
                ],
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                ),
                validator: (String? value) {
                  if (value!.trim().isEmpty) {
                    return 'The field is empty';
                  } else if (!value.trim().isValidPhoneNumber(10)) {
                    return 'Phone number must be 10 digit';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (!_key.currentState!.validate()) ;
                  },
                  child: const Text('text'))
            ],
          ),
        ),
      ),
    );
  }
}

extension PhoneNumberValidation on String {
  bool isValidPhoneNumber(int inputLength) {
    return _validatePhoneNumber(this, inputLength);
  }

  bool _validatePhoneNumber(String input, int inputLength) {
    if (input.length != inputLength) {
      return false;
    }
    for (int i = 0; i < input.length; i++) {
      print(i.toString());
      if (!_isDigit(input[i])) {
        return false;
      }
    }
    return true;
  }

  bool _isDigit(String inputCharacter) {
    // Check if the character is a digit using ASCII values 48 is 0, 57 is 9 as ASCII value
    final codeValue = inputCharacter.codeUnitAt(0);
    log(codeValue.toString());
    return inputCharacter.codeUnitAt(0) >= 48 &&
        inputCharacter.codeUnitAt(0) <= 57;
  }
}
