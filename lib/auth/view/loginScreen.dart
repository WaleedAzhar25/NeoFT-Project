import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft/auth/controller/auth_controller.dart';
import 'package:nft/auth/view/registerScreen.dart';
import 'package:nft/utils/TextView.dart';
import 'package:nft/utils/auth_input_text_field.dart';
import 'package:nft/utils/buttons.dart';
import 'package:nft/utils/colors.dart';
import 'package:nft/view/bottom_navigation.dart';
import '../../utils/size_config.dart';
import 'forgot_password.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AuthController controller=Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();
  bool _isValid=false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: SizeConfig.heightMultiplier*30,
              color: primaryColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Back(buttonColor: Colors.white.withOpacity(0.1), iconColor:Colors.white,
                              onTap:(){
                                Get.back();
                              }),
                          const Text("Sign In",style:  TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                          SizedBox(width: SizeConfig.widthMultiplier*10,)
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 40,bottom: 20),
                      child: Text("Hi, Welcome Back! 👋",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.white,wordSpacing: 2),),
                    ),
                    const Text("Lorem ipsum dolor sit amet, consector",style: TextStyle(color: Colors.white,fontSize: 16),),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Email Address",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
                       Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15,),
                          child: AuthTextInputField(
                            textInputType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            bordercolor: Colors.black12,
                            hintSize: 14,
                            hintcolor: Colors.black54,
                            textEditingController: emailController,
                            cursorColor: primaryColor,
                            focusBorderColor: primaryColor,
                            validator: (value){
                              _isValid = EmailValidator.validate(emailController.text);
                              if (emailController.text.isEmpty || _isValid == false) {
                                Get.snackbar("title", "message");
                              }
                              return null;
                            },
                            hintText: 'Enter your email address',
                          )
                      ),
                    const Text("Password",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
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
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if (value!.length < 8) {
                            Get.snackbar("Password", "Password should be atlas 8 characters");
                          }
                          return null;
                        },

                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                         GestureDetector(
                          onTap:(){
                              controller.isChecked.value=!controller.isChecked.value;

                          },
                          child: Container(
                            height: SizeConfig.heightMultiplier*3,
                            width: SizeConfig.widthMultiplier*6,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                border: const Border(
                                  top: BorderSide(color: Colors.black38),
                                  left: BorderSide(color: Colors.black38),
                                  right: BorderSide(color: Colors.black38),
                                  bottom: BorderSide(color: Colors.black38),
                                )
                            ),
                            child:  Obx(()=> Checkbox(
                                  focusColor: Colors.white,
                                  fillColor:  MaterialStateProperty.all(Colors.white),
                                  activeColor: Colors.transparent,
                                  side:const BorderSide(color: Colors.white),
                                  // overlayColor: MaterialStateColor,
                                  checkColor: Colors.black38,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  value: controller.isChecked.value,
                                  onChanged: (value){
                                      controller.isChecked.value=value!;
                                  }),
                            ),
                          ),
                        ),

                      SizedBox(width: SizeConfig.widthMultiplier*3),
                      const TextView(
                        text: "Remember me",
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        size: 15,
                      ),
                      const Spacer(),
                      TextButton(onPressed: (){
                        Get.to(const ForgotPassword());
                      },
                          style: ButtonStyle(
                            shadowColor: MaterialStateProperty.all(Colors.white),
                            overlayColor: MaterialStateProperty.all(Colors.white12),
                          ),
                          child:const TextView(
                            text: "Forgot Password",
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                            size: 15,
                          ) )
                    ]),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child:Row(
                        children: [
                          Expanded(
                            child: PrimaryButton(
                                text: "Sign In",
                                color: primaryColor,
                                onTap: (){
                                  Get.to(const BottomNavBar());
                                },
                                textColor: Colors.white,
                                borderColor: primaryColor),
                          ),
                        ],
                      )
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TextView(text: "Don't have an account?",color: Colors.black38,fontWeight: FontWeight.w500,size: 16,),
                        TextButton(onPressed: (){
                          Get.to(const RegisterScreen());
                        }, child: TextView(
                          color: primaryColor,
                          text: "Sign Up",
                          fontWeight: FontWeight.w500,
                          size: 16,
                        ))
                      ],
                    ),
                    const Padding(
                      padding:  EdgeInsets.all(12.0),
                      child:  Align(
                        alignment: Alignment.center,
                        child: TextView(
                          text: "Or Sign In with",
                          color: Colors.black38,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height:SizeConfig.heightMultiplier*6,
                            width: SizeConfig.widthMultiplier*15,
                            child: ElevatedButton(onPressed: (){

                            },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white38,
                                    elevation: 0
                                ),
                                child:Image.asset("assets/images/google.png",height: 30)),
                          ),
                          SizedBox(
                            height:SizeConfig.heightMultiplier*6,
                            width: SizeConfig.widthMultiplier*15,
                            child: ElevatedButton(onPressed: (){

                            },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white38,
                                    elevation: 0
                                ),
                                child:Image.asset("assets/images/mac.png",height: 30,)),
                          ),
                          SizedBox(
                            height:SizeConfig.heightMultiplier*6,
                            width: SizeConfig.widthMultiplier*15,
                            child: ElevatedButton(onPressed: (){

                            },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white38,
                                    elevation: 0
                                ),
                                child:Image.asset("assets/images/fb.png",height: 30)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
