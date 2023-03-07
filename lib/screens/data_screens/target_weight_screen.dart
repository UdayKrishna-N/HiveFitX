// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hivefitx/constants.dart';
import 'package:hivefitx/screens/data_screens/workout_active.dart';
import 'package:hivefitx/widgets/custom_appbar.dart';
import 'package:hivefitx/widgets/gradient_button.dart';

final formKey = GlobalKey<FormState>();

class TargetWeightScreen extends StatefulWidget {
  TargetWeightScreen({Key? key}) : super(key: key);

  @override
  State<TargetWeightScreen> createState() => _TargetWeightScreenState();
}

class _TargetWeightScreenState extends State<TargetWeightScreen> {
  TextEditingController targetWeightController = TextEditingController();
  bool isValid = true;

  @override
  void dispose() {
    targetWeightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomAppBar(text: 'What is Your Target Weight?',),
              Spacer(),
              isValid
                  ? SizedBox()
                  : Text(
                'Enter a valid weight',
                style: TextStyle(color: Colors.red),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 65,
                    height: 45,
                    child: TextFormField(
                      controller: targetWeightController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      autofocus: true,
                      style: styleHiveFit,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(3),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          isValid = false;
                          return '';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        errorStyle: TextStyle(
                          fontSize: 30,
                        ),
                        errorBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Text(
                    'kgs',
                    style: styleHiveFit.copyWith(
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              Spacer(),
              Column(
                children: [
                  GradientButton(buttonText: 'Continue', gradient: blueLinear,boxShadow: blueShadow,onTap: (){
                    setState(() {
                      if(formKey.currentState!.validate()){
                        isValid = true;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ActiveFactor(),),);
                      }
                      FocusScope.of(context).unfocus();
                    });
                  },),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
