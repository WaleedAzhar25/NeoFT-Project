import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft/auth/view/choose_wallet.dart';
import 'package:nft/utils/TextView.dart';
import 'package:nft/utils/size_config.dart';

import '../../utils/auth_input_text_field.dart';
import '../../utils/buttons.dart';
import '../../utils/colors.dart';
class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Back(
                    buttonColor: Colors.white,
                    iconColor: Colors.black54,
                    onTap: (){
                      Get.back();
                    }),
                  Align(
                   alignment: Alignment.center,
                   child: Padding(
                    padding:  const EdgeInsets.only(top: 20),
                    child: TextView(text: "Create a",
                    size: SizeConfig.textMultiplier*3.5,
                      fontWeight: FontWeight.w600,
                    ),
                ),
                 ),
                  Align(
                   alignment: Alignment.center,
                   child: Padding(
                    padding:  const EdgeInsets.only(top: 2),
                    child: TextView(text: "New Password",
                    size: SizeConfig.textMultiplier*3.5,
                      fontWeight: FontWeight.w600,
                    ),
                ),
                 ),
                  Align(
                   alignment: Alignment.center,
                   child: Padding(
                    padding:  const EdgeInsets.only(top: 10),
                    child: TextView(text: "Enter your new  password",
                    size: SizeConfig.textMultiplier*1.8,
                      fontWeight: FontWeight.w400,
                      color: Colors.black38,
                    ),
                ),
                 ),
                Padding(
                  padding: const EdgeInsets.only(top: 40,),
                  child: TextView(
                      text: "New Password",
                  size: SizeConfig.textMultiplier*2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(vertical: 15,),
                  child: AuthTextInputField(
                    hintText: "Enter your password",
                    isPassword: true,
                    hintcolor: Colors.black54,
                    hintSize: 14,
                    bordercolor: Colors.black12,
                    focusBorderColor: primaryColor,
                    cursorColor: primaryColor,
                    textEditingController: passwordController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.length < 8) {
                        Get.snackbar("Password", "Password should be atlas 8 characters");
                      }
                      return null;
                    },

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12,),
                  child: TextView(
                      text: "Confirm Password",
                  size: SizeConfig.textMultiplier*2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(vertical: 15,),
                  child: AuthTextInputField(
                    hintText: "Confirm your password",
                    isPassword: true,
                    hintcolor: Colors.black54,
                    hintSize: 14,
                    bordercolor: Colors.black12,
                    focusBorderColor: primaryColor,
                    cursorColor: primaryColor,
                    textEditingController: confirmPasswordController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value!.length < 8) {
                        Get.snackbar("Password", "Password should be atlas 8 characters");
                      }
                      return null;
                    },

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(
                            text: "Next",
                            color: primaryColor,
                            onTap: (){
                              Get.to(const ChooseWallet());
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
