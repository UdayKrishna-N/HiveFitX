// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hivefitx/screens/data_screens/name_screen.dart';
import 'package:hivefitx/widgets/choice_list.dart';
import 'package:hivefitx/widgets/custom_appbar.dart';

class BodyTypeScreen extends StatelessWidget {
   BodyTypeScreen({Key? key}) : super(key: key);

  List<String> bodyType = ['Skinny', 'Average', 'Overweight'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              text: 'Choose Your Current Body Type',
            ),
            SizedBox(
              height: 100,
            ),
            Expanded(
              child: ChoiceList(
                list: bodyType,
                buttonText: 'continue',
                onButtonTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NameScreen(),),);
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
