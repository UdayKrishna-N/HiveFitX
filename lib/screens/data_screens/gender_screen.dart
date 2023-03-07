import 'package:flutter/material.dart';
import 'package:hivefitx/screens/data_screens/goal_screen.dart';
import 'package:hivefitx/widgets/choice_list.dart';
import 'package:hivefitx/widgets/custom_appbar.dart';


class GenderScreen extends StatelessWidget {
  GenderScreen({super.key});

  final List<String> genders = ['male', 'female'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              text: 'Gender',
            ),
            SizedBox(
              height: 100,
            ),
            Expanded(
              child: ChoiceList(
                list: genders,
                buttonText: 'Continue',
                onButtonTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GoalScreen(),),);
                },
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
