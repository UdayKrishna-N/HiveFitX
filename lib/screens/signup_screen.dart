import 'package:flutter/material.dart';
import 'package:hivefitx/constants.dart';
import 'package:hivefitx/screens/dashboard_screen.dart';
import 'package:hivefitx/widgets/custom_appbar.dart';
import 'package:hivefitx/widgets/gradient_button.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // variables
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isValidate1 = false;
  bool isValidate2 = false;
  bool isValidate3 = false;

  void validatePassword(String password){

    final numericRegExp = RegExp(r'[0-9]');
    final symbolRegExp = RegExp(r'[@#%&!*()_{}]');

    setState(() {
      isValidate1 = false;
      if(password.length >= 8){
        isValidate1 = true;
      }
      isValidate2 = false;
      if(numericRegExp.hasMatch(password)){
        isValidate2 = true;
      }

      isValidate3 = false;
      if(symbolRegExp.hasMatch(password)){
        isValidate3 = true;
      }
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomAppBar(
                  text: 'Create Account',
                ),
                SizedBox(
                  height: 70,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        // Title
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'HiveFit',
                                style: styleHiveFit,
                              ),
                              TextSpan(
                                text: 'X',
                                style: styleX,
                              ),
                            ],
                          ),
                        ),
                        // sub-quote
                        Text(
                          "Your Fitness Tribe",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: gray1,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        // Email TextField
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Container(
                              height: 64,
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Center(
                                child: TextField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  style: headline.copyWith(
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email_outlined,
                                      color: Colors.black87,
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'Email',
                                    hintStyle: headline.copyWith(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        //  Password TextField
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Container(
                              height: 64,
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Center(
                                child: TextField(
                                  controller: passwordController,
                                  obscureText: !isPasswordVisible,
                                  onChanged: (password) => validatePassword(password),
                                  style: headline.copyWith(
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.lock_outline,
                                      color: Colors.black87,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isPasswordVisible =
                                              !isPasswordVisible;
                                        });
                                      },
                                      icon: !isPasswordVisible
                                          ? Icon(
                                              Icons.visibility_off_outlined,
                                              color: Colors.black87,
                                            )
                                          : Icon(
                                              Icons.visibility_outlined,
                                              color: Colors.black87,
                                            ),
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'Password',
                                    hintStyle: headline.copyWith(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //   password validator1
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //check box
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: isValidate1 ? Colors.green : Colors.transparent,
                                  border: Border.all(color: isValidate1 ? Colors.transparent : Colors.black87),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.check,
                                    size: 18,
                                    color: isValidate1 ? Colors.white : Colors.transparent,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Text(
                                  'Password must contain 8 or more characters.',
                                  style: headline.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        //   password validator2
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //check box
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: isValidate2 ? Colors.green : Colors.transparent,
                                  border: Border.all(color: isValidate2 ? Colors.transparent : Colors.black87),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.check,
                                    size: 18,
                                    color: isValidate2 ? Colors.white : Colors.transparent,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Text(
                                  'Contains at least 1 number',
                                  style: headline.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //   password validator3
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //check box
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: isValidate3 ? Colors.green : Colors.transparent,
                                  border: Border.all(color: isValidate3 ? Colors.transparent : Colors.black87),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.check,
                                    size: 18,
                                    color: isValidate3 ? Colors.white : Colors.transparent,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Text(
                                  'Contains at least 1 special character',
                                  style: headline.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                // create account button
                Column(
                  children: [
                    GradientButton(
                      buttonText: 'Create Account',
                      gradient: blueLinear,
                      boxShadow: blueShadow,
                      onTap: () {
                        if(isValidate1 && isValidate2 && isValidate3){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DashboardScreen(),
                            ),
                          );
                        }else{
                          print('Not Validated!...');
                        }
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
      ),
    );
  }
}
