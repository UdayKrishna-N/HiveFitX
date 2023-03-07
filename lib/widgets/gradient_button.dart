import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key? key,
    required this.buttonText,
    required this.gradient,
    required this.boxShadow,
    required this.onTap,
    this.prefix = false,
    this.suffix = false,
    this.prefixIconData = Icons.add,
    this.suffixIconData = Icons.add,
  }) : super(key: key);

  final Gradient gradient;
  final BoxShadow boxShadow;
  final String buttonText;
  final void Function()? onTap;
  final bool prefix;
  final bool suffix;
  final IconData prefixIconData;
  final IconData suffixIconData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              gradient: gradient,
              boxShadow: [boxShadow],
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                prefix
                    ? Icon(prefixIconData,color: Colors.white,size: 20,)
                    : SizedBox(),
                SizedBox(
                  width: 7,
                ),
                Text(
                  buttonText,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                suffix
                    ? Icon(suffixIconData,color: Colors.white,size: 20,)
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
