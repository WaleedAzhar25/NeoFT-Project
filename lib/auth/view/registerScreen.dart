
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft/utils/TextView.dart';
import 'package:nft/utils/auth_input_text_field.dart';
import 'package:nft/utils/buttons.dart';
import 'package:nft/utils/colors.dart';
import 'package:nft/utils/size_config.dart';
import 'loginScreen.dart';
import 'otpScreen.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isValid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: SizeConfig.heightMultiplier * 30,
              color: primaryColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Back(
                              buttonColor: Colors.white.withOpacity(0.1),
                              iconColor: Colors.white,
                              onTap: () {
                                Get.back();
                              }),
                          const Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: SizeConfig.widthMultiplier * 10,
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 40, bottom: 20),
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            wordSpacing: 2),
                      ),
                    ),
                    const Text(
                      "Lorem ipsum dolor sit amet, connector",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Full Name",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        child: AuthTextInputField(
                          textInputType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          bordercolor: Colors.black12,
                          hintSize: 14,
                          hintcolor: Colors.black54,
                          cursorColor: primaryColor,
                          focusBorderColor: primaryColor,
                          textEditingController: usernameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              Get.snackbar("Username", "Enter your user name");
                            }
                            return null;
                          },
                          hintText: 'Enter your name',
                        )),
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
                    const Text(
                      "Password",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      child: AuthTextInputField(
                        hintText: "Enter your password",
                        isPassword: true,
                        maxLines: 1,
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
                            Get.snackbar("Password",
                                "Password should be atlas 8 characters");
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: PrimaryButton(
                                text: "Create an Account",
                                color: primaryColor,
                                onTap: () {
                                  Get.to(const OTPScreen());
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
                        const TextView(text: "Already have an account?",color: Colors.black38,fontWeight: FontWeight.w500,size: 16,),
                        TextButton(onPressed: (){
                          Get.to(const LoginScreen());
                        }, child: TextView(
                          color: primaryColor,
                          text: "Sign in",
                          fontWeight: FontWeight.w500,
                          size: 16,
                        ))
                      ],
                    ),

                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: TextView(
                          text: "Or Sign Up with",
                          color: Colors.black38,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 6,
                            width: SizeConfig.widthMultiplier * 15,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white38, elevation: 0),
                                child: Image.asset("assets/images/google.png",
                                    height: 30)),
                          ),
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 6,
                            width: SizeConfig.widthMultiplier * 15,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white38, elevation: 0),
                                child: Image.asset(
                                  "assets/images/mac.png",
                                  height: 30,
                                )),
                          ),
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 6,
                            width: SizeConfig.widthMultiplier * 15,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white38, elevation: 0),
                                child: Image.asset("assets/images/fb.png",
                                    height: 30)),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
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
                                              Get.back();
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
                          child: RichText(
                            text: TextSpan(
                              text: 'By signing up you agree to our ',
                              style: const TextStyle(
                                  color: Colors.black38,
                                  fontSize: 15,
                                  wordSpacing: 2),
                              children: [
                                TextSpan(
                                    text: 'Terms \n',
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
                                    text: 'Conditions of Use',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            SizeConfig.textMultiplier * 1.5)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
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
