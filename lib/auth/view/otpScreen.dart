import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft/auth/controller/auth_controller.dart';
import 'package:nft/auth/view/choose_wallet.dart';
import 'package:nft/utils/colors.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../../utils/TextView.dart';
import '../../utils/buttons.dart';
import '../../utils/size_config.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
AuthController controller=Get.put(AuthController());

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
                      text: "Enter OTP",
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
                      text: "We have just sent you 4 digit code via your ",
                      size: 15,
                      color: Colors.black38,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: const TextSpan(
                      text: 'email  ',
                      style: TextStyle(color: Colors.black38),
                      children: [
                        TextSpan(
                            text:'example@gmail.com',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black
                          )
                        ),

                      ]
                    )
                  )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
                  child: OTPTextField(
                      length: 4,
                      obscureText: true,
                      otpFieldStyle: OtpFieldStyle(

                        focusBorderColor: primaryColor,
                      ),
                      width: MediaQuery.of(context).size.width,
                      fieldWidth: 45,
                      style:  const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                      ),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.box,
                      onCompleted: (pin) {
                        controller.otp.value=pin;
                      },
                    ),
                  ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(text: "Continue",
                            color: primaryColor,
                            onTap: (){
                              Get.dialog(
                                  Center(
                                    child: Container(
                                      height: SizeConfig.heightMultiplier*25,
                                      width: SizeConfig.widthMultiplier*80,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(12)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Column(
                                          children:  [
                                            RichText(
                                              text: TextSpan(
                                                text: 'I agree to the ',
                                                style: const TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 15,
                                                    wordSpacing: 2),
                                                children: [
                                                  TextSpan(
                                                      text: 'Terms of Service ',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.w600,
                                                          fontSize:
                                                          SizeConfig.textMultiplier * 1.5)),
                                                  const TextSpan(
                                                      text: 'and ',
                                                      style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize: 15,
                                                          letterSpacing: 1)),
                                                  TextSpan(
                                                      text: 'Conditions of Use ',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.w600,
                                                          fontSize:
                                                          SizeConfig.textMultiplier * 1.5)),
                                                  const TextSpan(
                                                      text: ' including consent to the electronic communications and I affirm that the information provided is my own.',
                                                      style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize: 15,
                                                          letterSpacing: 1)),
                                                ],
                                              ),
                                            ),
                                            const Spacer(),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                TextButton(onPressed: (){
                                                  Get.back();
                                                },
                                                    child: const TextView(
                                                      text: "Disagree",
                                                      color: Colors.red,
                                                      size: 16,
                                                      fontWeight: FontWeight.w600,
                                                    )),

                                                PrimaryButton(text: "Agree and Continue",
                                                    color: primaryColor,
                                                    textSize: 14,
                                                    onTap: (){
                                                      Get.to(const ChooseWallet());
                                                    },
                                                    textColor: Colors.white,
                                                    borderColor: primaryColor)
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                              );

                            },
                            textColor: Colors.white,
                            borderColor: primaryColor),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextView(text: "Didn\'t receive code?",color: Colors.black38,fontWeight: FontWeight.w500,size: 16,),
                    TextButton(onPressed: (){
                    }, child: TextView(
                      color: primaryColor,
                      text: "Resend Code",
                      fontWeight: FontWeight.w500,
                      size: 16,
                    ))
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
