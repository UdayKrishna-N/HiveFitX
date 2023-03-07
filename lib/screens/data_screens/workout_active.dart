// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hivefitx/screens/signup_screen.dart';
import 'package:hivefitx/widgets/choice_list.dart';

import '../../widgets/custom_appbar.dart';

class ActiveFactor extends StatelessWidget {
  ActiveFactor({Key? key}) : super(key: key);

  List<String> activeFactor = ['Not Active','Lightly Active','Moderately Active','Very Active','Extra Active'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              text: 'How Often You Workout?',
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: ChoiceList(
                list: activeFactor,
                buttonText: 'Continue',
                onButtonTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),),);},
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );;
  }
}
