import 'package:flutter/material.dart';

import 'colors.dart';
class PrimaryButton extends StatelessWidget {
   const PrimaryButton({Key? key, required this.text, required this.color, required this.onTap, required this.textColor, required this.borderColor, this.radius=12, this.textSize=18,  this.contentPadding=16}) : super(key: key);
  final String text;
  final Color color;
  final Function() onTap;
  final Color textColor;
  final double textSize;
  final Color borderColor;
  final double radius;
  final double contentPadding;


  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(onPressed: onTap,
        style: ElevatedButton.styleFrom(
            primary: color,
            side: BorderSide(color: borderColor),
            shape: RoundedRectangleBorder(

                borderRadius: BorderRadius.circular(radius)
            )
        ),
        child:  Padding(
          padding:  EdgeInsets.all(contentPadding),
          child: Text(text,style: TextStyle(color: textColor,fontSize: textSize,fontWeight: FontWeight.w500),),
        ));
  }
}

class Back extends StatelessWidget {
  const Back({Key? key,  required this.buttonColor, required this.iconColor, required this.onTap,  this.icon=Icons.arrow_back_ios,  this.size=20, this.padding=5, this.bottom=0,  this.elevation=1,  this.borderColor=Colors.black12}) : super(key: key);
  final Color buttonColor;
  final Color iconColor;
  final Color borderColor;
  final IconData icon;
  final double elevation;
  final Function() onTap;
  final double size;
  final double padding;
  final double bottom;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: elevation,
        color: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        child: Container(
            height:40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border:  Border(
                top: BorderSide(color: borderColor),
                left: BorderSide(color: borderColor),
                bottom: BorderSide(color: borderColor),
                right: BorderSide(color: borderColor),
              ),
            ),
            child: Center(
              child:Padding(
                padding:  EdgeInsets.only(left: padding,bottom: bottom),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: size,
                ),
              ),
            ),
        ),
      ),
    );

  }
}

