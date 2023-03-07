// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hivefitx/constants.dart';
import 'package:hivefitx/screens/data_screens/age_screen.dart';
import 'package:hivefitx/widgets/custom_appbar.dart';
import 'package:hivefitx/widgets/gradient_button.dart';

final formKey = GlobalKey<FormState>();

class NameScreen extends StatefulWidget {
  NameScreen({Key? key}) : super(key: key);

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  TextEditingController nameController = TextEditingController();

  bool isValid = true;

  @override
  void dispose() {
    nameController.dispose();
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
              CustomAppBar(
                text: 'What is Your Name?',
              ),
              Spacer(),
              Center(
                child: Column(
                  children: [
                    isValid
                        ? SizedBox()
                        : Text(
                      'Enter a valid name',
                      style: TextStyle(color: Colors.red),
                    ),
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      autofocus: true,
                      style: styleHiveFit,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(15),
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          isValid = false;
                          return '';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Column(
                children: [
                  GradientButton(
                    buttonText: 'Continue',
                    gradient: blueLinear,
                    boxShadow: blueShadow,
                    onTap: () {
                      setState(
                        () {
                          if (formKey.currentState!.validate()) {
                            isValid = true;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AgeScreen(),
                              ),
                            );
                          }
                          FocusScope.of(context).unfocus();
                        },
                      );
                    },
                  ),
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
