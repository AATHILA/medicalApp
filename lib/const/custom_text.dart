import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class CustomText extends StatelessWidget {
  String title;
  Color color;
  FontWeight fontWeight;
  double? fontSize;
   CustomText({super.key, required this.title,
     this.color=Colors.blueGrey,
     this.fontWeight=FontWeight.w600,
     this.fontSize,

  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,style: TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize??width*0.03,
    ),
    );
  }
}
