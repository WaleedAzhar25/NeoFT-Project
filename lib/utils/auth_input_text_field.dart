import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nft/utils/colors.dart';

class AuthTextInputField extends StatefulWidget {
  final Color textColor;
  final String? labelText;
  final String hintText;
  final double? hintSize;
  final Color hintcolor;
  final Color bordercolor;
  final double radius;
  final bool isPassword;
  final Color fillColor;
  final Color cursorColor;
  final Color focusBorderColor;
  final TextEditingController? textEditingController;
  final TextInputType textInputType;
  final suffixIcon;
  final prefixIcon;
  final maxLines;
  final enabled;
  final TextInputAction textInputAction;
  final String? Function(String? val)? validator;
  final String? Function(String? val)? onChanged;
  final String? Function(String? val)? onSubmitted;
  final double topPadding;
  final double leftPadding;
  final double rightPadding;
  final double bottomPadding;

  const AuthTextInputField({
    Key? key,
    required this.hintText,
    this.textEditingController,
    this.isPassword = false,
    this.hintSize,
    this.hintcolor = Colors.grey,
    this.fillColor = Colors.transparent,
    this.textColor = Colors.black,
    this.cursorColor = Colors.black,
    this.textInputType = TextInputType.text,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLines=1,
    this.enabled,
    this.labelText,
    this.radius = 10,
    this.bordercolor = Colors.black,
    this.textInputAction = TextInputAction.next,
    this.validator, this.focusBorderColor=Colors.black54,  this.topPadding=0,  this.leftPadding=10,  this.rightPadding=0,  this.bottomPadding=0,
    this.onChanged, this.onSubmitted,

  }) : super(key: key);

  @override
  State<AuthTextInputField> createState() => _TextInputFieldViewState();
}

class _TextInputFieldViewState extends State<AuthTextInputField> {
  bool isObscure = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isObscure = widget.isPassword == true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      onChanged: widget.onChanged,
      obscureText: isObscure,
      onFieldSubmitted: widget.onSubmitted,
      textInputAction: widget.textInputAction,
      style: TextStyle(color: widget.textColor),
      controller: widget.textEditingController,
      keyboardType: widget.textInputType,
      validator: widget.validator,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        prefixStyle: TextStyle(
          color: widget.bordercolor,
        ),
        contentPadding: EdgeInsets.only(top: widget.topPadding,left: widget.leftPadding,right: widget.rightPadding,bottom: widget.bottomPadding),
        filled: true,
        fillColor: widget.fillColor,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: BorderSide(color: widget.bordercolor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: BorderSide(color: widget.focusBorderColor)),
        hintText: widget.hintText,
        hintStyle:
            TextStyle(fontSize: widget.hintSize, color: widget.hintcolor),
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: isObscure
                    ? const Icon(Icons.remove_red_eye,color: Colors.black54,)
                    : const Icon(CupertinoIcons.eye_slash_fill,color: Colors.black54,)
                )
            : widget.suffixIcon,
      ),
      cursorColor: widget.cursorColor,
    );
  }
}
