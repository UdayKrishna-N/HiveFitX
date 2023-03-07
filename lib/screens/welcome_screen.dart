import 'package:flutter/material.dart';
import 'package:hivefitx/constants.dart';
import 'package:hivefitx/screens/dashboard_screen.dart';
import 'package:hivefitx/screens/data_screens/gender_screen.dart';
import 'package:hivefitx/widgets/gradient_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
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
            Spacer(),
            GradientButton(
              buttonText: 'Get Started',
              gradient: blueLinear,
              boxShadow: blueShadow,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => GenderScreen(),),);
              },
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Divider(
                thickness: 1.0,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text('Already have an account? LogIn',style: subText.copyWith(color: blackColor),),
            SizedBox(
              height: 5,
            ),
            GradientButton(
              buttonText: 'Login',
              gradient: blueLinear,
              boxShadow: blueShadow,
              prefix: true,
              prefixIconData: Icons.login_rounded,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen(),),);
              },
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
