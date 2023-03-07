import 'package:flutter/material.dart';
import 'package:hivefitx/constants.dart';
import 'package:hivefitx/widgets/gradient_button.dart';


class ChoiceList extends StatefulWidget {
  const ChoiceList({
    Key? key,
    required this.list,
    required this.buttonText,
    required this.onButtonTap,
  }) : super(key: key);

  final List list;
  final String buttonText;
  final void Function()? onButtonTap;

  @override
  State<ChoiceList> createState() => _ChoiceListState();
}

class _ChoiceListState extends State<ChoiceList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Card(
                  elevation: (index == selectedIndex) ? 3 : 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Container(
                    height: 90,
                    decoration: BoxDecoration(
                      color: (index == selectedIndex)
                          ? Colors.white
                          : Colors.white70,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.list[index],
                            style: headline.copyWith(
                              color: (index == selectedIndex)
                                  ? Colors.black87
                                  : Colors.black54,
                              fontSize: 16,
                            ),
                          ),
                          (index == selectedIndex)
                              ? Icon(
                                  Icons.check,
                                  color: Colors.blue,
                                  size: 30,
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: GradientButton(
              buttonText: widget.buttonText,
              gradient: blueLinear,
              boxShadow: blueShadow,
              onTap: widget.onButtonTap,
            ),
          ),
        ),
      ],
    );
  }
}
