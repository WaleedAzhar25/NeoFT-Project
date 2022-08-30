import 'dart:developer';
import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nft/utils/colors.dart';
import 'package:nft/view/profile/setting_profile.dart';
import '../../utils/TextView.dart';
import '../../utils/auth_input_text_field.dart';
import '../../utils/buttons.dart';
import '../../utils/size_config.dart';
class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isValid = false;
  File? background;
  File? dp;
  Future backgroundImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => background = imageTemp);
    } on PlatformException catch (e) {
      log('Failed to pick image: $e');
    }
  }
  Future dpImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => dp = imageTemp);
    } on PlatformException catch (e) {
      log('Failed to pick image: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EditProfileTitle(),
                Padding(
                  padding:
                   const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: SizedBox(
                    height: SizeConfig.heightMultiplier * 19,
                    width: SizeConfig.widthMultiplier * 100,
                    child: Stack(
                      children: [
                        background==null?Image.asset("assets/images/profile_background.png"):Container(
                            height: SizeConfig.heightMultiplier * 14,
                            width: SizeConfig.widthMultiplier * 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Image.file(File(background!.path),fit: BoxFit.fill,)),
                        Positioned(
                          top: 5,
                          right: 10,
                          child: GestureDetector(
                            onTap: (){
                              backgroundImage();
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  shape: BoxShape.circle
                              ),
                              child: const Icon(
                                Icons.edit_outlined,color: Colors.white,size:15,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              SizedBox(
                                height: SizeConfig.heightMultiplier*10,
                                width: SizeConfig.widthMultiplier*20,
                                child: Stack(
                                  children:  [
                                     CircleAvatar(
                                      radius: 45,
                                      backgroundImage: dp==null?
                                      const AssetImage("assets/images/profile.png"):
                                      FileImage(File(dp!.path))as ImageProvider,
                                    ),
                                    Positioned(
                                      bottom: 5,
                                      right: 0,
                                      child: GestureDetector(
                                        onTap: (){
                                          dpImage();
                                        },
                                        child: Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                            color: primaryColor,
                                            shape: BoxShape.circle
                                          ),
                                          child: const Icon(
                                            Icons.edit_outlined,color: Colors.white,size:15,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                  const Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      "Full Name",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
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
                    "Phone Number",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    child: AuthTextInputField(
                      hintText: "Enter your phone number",
                      maxLines: 1,
                      hintcolor: Colors.black54,
                      hintSize: 14,
                      bordercolor: Colors.black12,
                      focusBorderColor: primaryColor,
                      cursorColor: primaryColor,
                      textEditingController: passwordController,
                      textInputType: TextInputType.phone,
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
                    padding: const EdgeInsets.only(top: 70),
                    child: Row(
                      children: [
                        Expanded(
                          child: PrimaryButton(
                              text: "Save Changes",
                              textSize: 17,
                              color: primaryColor,
                              onTap: () {
                                Get.to(const SettingProfile());
                              },
                              textColor: Colors.white,
                              borderColor: primaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class EditProfileTitle extends StatelessWidget {
  const EditProfileTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Back(
            buttonColor: Colors.white,
            iconColor: Colors.black,
            onTap: () {
              Get.back();
            }),
        TextView(
          text: "Edit Profile",
          size: SizeConfig.textMultiplier * 2.5,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(width: 40,),
      ],
    );
  }
}

