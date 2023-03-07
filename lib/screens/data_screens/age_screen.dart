// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hivefitx/constants.dart';
import 'package:hivefitx/screens/data_screens/height_screen.dart';
import 'package:hivefitx/widgets/custom_appbar.dart';
import 'package:hivefitx/widgets/gradient_button.dart';

final formKey = GlobalKey<FormState>();

class AgeScreen extends StatefulWidget {
  AgeScreen({Key? key}) : super(key: key);

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  TextEditingController ageController = TextEditingController();
  bool isValid = true;

  @override
  void dispose() {
    ageController.dispose();
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
              CustomAppBar(text: 'How Old Are You?',),
              Spacer(),
              isValid
                  ? SizedBox()
                  : Text(
                'Enter a valid height',
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
                    width: 60,
                    height: 45,
                    child: TextFormField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      autofocus: true,
                      style: styleHiveFit,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(2),
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
                    'years',
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HeightScreen(),),);
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
