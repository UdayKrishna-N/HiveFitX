// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hivefitx/screens/data_screens/bodytype_screen.dart';
import 'package:hivefitx/widgets/choice_list.dart';
import 'package:hivefitx/widgets/custom_appbar.dart';

class GoalScreen extends StatelessWidget {
  GoalScreen({Key? key}) : super(key: key);

  List<String> goals = ['Lose Weight', 'Build Muscle', 'Gain Weight'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              text: 'What is Your Goal?',
            ),
            SizedBox(
              height: 100,
            ),
            Expanded(
              child: ChoiceList(
                list: goals,
                buttonText: 'Continue',
                onButtonTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => BodyTypeScreen(),),);},
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
