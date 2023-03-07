import 'package:flutter/material.dart';
import 'package:hivefitx/constants.dart';
import 'package:hivefitx/packages/date.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int dayCount = 0;
  int stepGoal = 8000;
  int stepCount = 1000;
  int selectedIndex = 0;
  late int newGoal;


  void setGoalBottomSheet() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: 30,
            ),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Text(
                  'Change Goal',
                  style: styleHiveFit.copyWith(
                    color: Colors.black87,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 50,
                    physics: FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        // selectedIndex = index;
                        newGoal = (index + 1) * 1000;
                      });
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 50,
                        builder: (context, index) {
                          return Text(
                            ((index + 1) * 1000).toString(),
                            style: styleHiveFit.copyWith(
                              fontSize: 20,
                            ),
                            // style: (selectedIndex != index) ? styleHiveFit.copyWith(
                            //   fontSize: 20,
                            // ): styleHiveFit.copyWith(
                            //   fontSize: 24,
                            //   color: Colors.blue,
                            // ),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // cancel button
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          gradient: blueLinear,
                          boxShadow: [blueShadow],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          'Cancel',
                          style: subText.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    // set goal button
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          stepGoal = newGoal;
                          Navigator.pop(context);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          gradient: blueLinear,
                          boxShadow: [blueShadow],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          'Set Goal',
                          style: subText.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            // Date + Day
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            dayCount++;
                          });
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 20,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            Date().getDate(
                              DateTime.now().subtract(
                                Duration(days: dayCount),
                              ),
                            ),
                            style: styleHiveFit.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            Date().getDay(
                              DateTime.now().subtract(
                                Duration(days: dayCount),
                              ),
                            ),
                            style: styleHiveFit.copyWith(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            dayCount--;
                          });
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      '  Workout Plan',
                      style: styleHiveFit.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Workout Plan Container
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: blueLinear,
                        boxShadow: [blueShadow],
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.mood_outlined,
                              size: 50,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Rest Day',
                              style: styleHiveFit.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '  Step Counter',
                      style: styleHiveFit.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Step Counter Container
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [blueShadow],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            stepCount.toString(),
                            style: styleHiveFit.copyWith(
                              fontSize: 34,
                              color: Colors.blue,
                            ),
                          ),
                          Text('Goal : $stepGoal steps',style: TextStyle(fontWeight: FontWeight.w700),),
                          SizedBox(
                            height: 20,
                          ),
                          LinearPercentIndicator(
                            animation: true,
                            // animationDuration: ,
                            barRadius: Radius.circular(10),
                            lineHeight: 20,
                            percent: stepCount / stepGoal,
                            backgroundColor: Colors.black12,
                            linearGradient: blueLinear,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //  set goal button
                          GestureDetector(
                            onTap: () {
                              setGoalBottomSheet();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                gradient: blueLinear,
                                boxShadow: [blueShadow],
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                'Change Goal',
                                style: subText.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
