import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft/auth/view/loginScreen.dart';
import 'package:nft/utils/buttons.dart';
import 'package:nft/utils/colors.dart';
import 'package:nft/view/profile/edit_profile.dart';
import 'package:nft/view/profile/notification_profile_screen.dart';
import 'package:nft/view/profile/settings_screen.dart';
import '../../utils/TextView.dart';
import '../../utils/size_config.dart';
class SettingProfile extends StatefulWidget {
  const SettingProfile({Key? key}) : super(key: key);

  @override
  State<SettingProfile> createState() => _SettingProfileState();
}

class _SettingProfileState extends State<SettingProfile> {
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
                const BackProfile(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                  ),
                ),
                 Align(
                  alignment: Alignment.center,
                  child: TextView(
                      text: 'Wade Warren',
                  size: SizeConfig.textMultiplier*2.4,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 8),
                   child: Align(
                    alignment: Alignment.center,
                    child: TextView(
                        text: '@WadeWarren',
                    size: SizeConfig.textMultiplier*1.6,
                      fontWeight: FontWeight.w500,
                      color: Colors.black38,
                    ),
                ),
                 ),
                Padding(
                  padding: const EdgeInsets.only(top: 30,bottom: 20,left: 15),
                  child: TextView(
                    text: 'Personal Info',
                    size: SizeConfig.textMultiplier*2,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                 ListTile(
                  leading: const Icon(CupertinoIcons.person,color: Colors.black,size: 28,),
                  title: TextView(text: 'Your Profile',size: SizeConfig.textMultiplier*2,),
                   onTap: (){
                    Get.to(const EditProfile());
                   },
                ),
                const Padding(
                   padding:  EdgeInsets.symmetric(horizontal: 20),
                   child:  Divider(),
                 ),
                 ListTile(
                  leading: const Icon(CupertinoIcons.lock,color: Colors.black,size: 28,),
                  title: TextView(text: 'Change Password',size: SizeConfig.textMultiplier*2,),
                   onTap: (){

                   },
                ),
                const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20),
                  child:  Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30,bottom: 20,left: 15),
                  child: TextView(
                    text: 'Personal Info',
                    size: SizeConfig.textMultiplier*2,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                ListTile(
                  leading: const Icon(CupertinoIcons.bell,color: Colors.black,size: 28,),
                  title: TextView(text: 'Notifications',size: SizeConfig.textMultiplier*2,),
                  onTap: (){
                    Get.to(const NotificationProfileScreen());
                  },
                ),
                const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20),
                  child:  Divider(),
                ),
                ListTile(
                  leading: const Icon(Icons.settings_outlined,color: Colors.black54,size: 28,),
                  title: TextView(text: 'Settings',size: SizeConfig.textMultiplier*2,),
                  onTap: (){
                    Get.to(const SettingsScreen());
                  },
                ),
                const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20),
                  child:  Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextButton(onPressed: (){
                      Get.dialog(
                          Scaffold(
                            backgroundColor: Colors.transparent,
                            body: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)
                                ),
                                height: SizeConfig.heightMultiplier*35,
                                width: SizeConfig.widthMultiplier*80,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            IconButton(onPressed:(){
                                              Get.back();
                                            },
                                                icon: const Icon(CupertinoIcons.xmark))
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 12),
                                          child: TextView(text: 'Are you sure want to',
                                          size: SizeConfig.textMultiplier*2.2,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        TextView(text: 'Log Out?',
                                        size: SizeConfig.textMultiplier*2.2,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 30,right:30,top: 40,bottom: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: PrimaryButton(
                                                    text: "Cancel",
                                                    color: primaryColor,
                                                    textSize: 14,
                                                    onTap: (){
                                                      Get.back();
                                                    },
                                                    textColor: Colors.white,
                                                    borderColor: primaryColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 30,right:30,top:0,bottom: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              TextButton(onPressed: (){
                                                Get.offAll(const LoginScreen());
                                              }, child: TextView(
                                                text: 'Log Out',
                                                size: SizeConfig.textMultiplier*1.8,
                                                color: Colors.red,
                                              ))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ),
                          )
                      );

                    },
                        child:  TextView(
                      text: 'Logout',
                      color: Colors.red,
                        size: SizeConfig.textMultiplier*2,)
                    ),
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

class BackProfile extends StatelessWidget {
  const BackProfile({
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
          text: "Profile",
          size: SizeConfig.textMultiplier * 2.5,
          fontWeight: FontWeight.w600,
        ),
      const SizedBox(width: 40,),
      ],
    );
  }
}
