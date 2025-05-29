import 'package:flutter/material.dart';

import '../../main.dart';


class CustomButton extends StatelessWidget {
  late final double width;
  late final double height;
  final VoidCallback onPressed;
  late final String text;
  late final Color? backgroundColor;
  late final Color? textColor;
  late final double? borderRadius;
  late final IconData? icon;

  CustomButton({
    super.key,
    this.width=250,
    this.height = 50,
    required this.onPressed,
    this.text = 'Save',
    this.backgroundColor=Colors.lightBlue,
    this.textColor,
    this.borderRadius,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width*0.7,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child:
        Container(
          alignment: Alignment.center,
          child:
          Text(
            text,
            style: TextStyle(
                color: textColor ?? Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: width*0.06
            ),
          ),
        ),

      ),
    );
  }
}



