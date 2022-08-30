import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft/utils/TextView.dart';
import 'package:nft/utils/buttons.dart';
import '../../utils/auth_input_text_field.dart';
import '../../utils/colors.dart';
import 'create_new_password.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();
  bool _isValid = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Back(
                  buttonColor: Colors.white,
                    iconColor: Colors.black54,
                    onTap: (){
                      Get.back();
                    }),
                 const Padding(
                   padding: EdgeInsets.all(12.0),
                   child: Align(
                    alignment: Alignment.center,
                    child: TextView(
                      text: "Forgot Password",
                      size: 30,
                      fontWeight: FontWeight.w700,
                    ),
                ),
                 ),
                 const Padding(
                   padding: EdgeInsets.all(12.0),
                   child: Align(
                    alignment: Alignment.center,
                    child: TextView(
                      color: Colors.black38,
                      text: "Recover your account password",
                      size: 14,
                      fontWeight: FontWeight.w500,
                    ),
                ),
                 ),
                const Text(
                  'E-mail',
                  style:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    child: AuthTextInputField(
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      bordercolor: Colors.black12,
                      hintSize: 14,
                      textEditingController: emailController,
                      hintcolor: Colors.black54,
                      cursorColor: primaryColor,
                      focusBorderColor: primaryColor,
                      validator: (value) {
                        _isValid =
                            EmailValidator.validate(emailController.text);
                        if (emailController.text.isEmpty ||
                            _isValid == false) {
                          Get.snackbar(
                            "Email",
                            "Enter Your valid email",
                          );
                        }
                        return null;
                      },
                      hintText: 'Enter your email address',
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(text: "Next",
                            color: primaryColor,
                            onTap: (){
                          Get.to(const CreateNewPassword());
                            },
                            textColor: Colors.white,
                            borderColor: primaryColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
