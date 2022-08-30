import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  String title;
  final double? height;
  final double? width;
  final Color? colour, textcolour;
  final double? fontSize;

  // Function callback;
  VoidCallback callback;

  CustomAuthButton(
      {Key? key,
      this.title = "",
      required this.callback,
      this.colour,
      this.textcolour = Colors.white,
      this.height,
      this.width,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: MaterialButton(
        height: height,
        minWidth: width,
        color: colour,
        onPressed: () {
          callback();
        },
        child: Text(
          title,
          style: TextStyle(fontSize: fontSize, color: textcolour),
        ),
      ),
    );
  }
}
