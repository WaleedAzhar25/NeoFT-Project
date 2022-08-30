import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/TextView.dart';
import '../../utils/buttons.dart';
import '../../utils/size_config.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Back(
                      buttonColor: Colors.white,
                      iconColor: Colors.black,
                      onTap: () {
                        Get.back();
                      }),
                  TextView(
                    text: "Settings",
                    size: SizeConfig.textMultiplier * 2.5,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(width: 40,),
                ],
            ),
              ),
                ListTile(
                  leading: const Icon(CupertinoIcons.shopping_cart,color: Colors.black,size: 25,),
                  title: TextView(text: 'History Transaction',size: SizeConfig.textMultiplier*2,),
                  onTap: (){
                  },
                ),
                const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20),
                  child:  Divider(),
                ),
                ListTile(
                  leading: const Icon(Icons.account_balance_wallet_outlined,color: Colors.black,size: 25,),
                  title: TextView(text: 'Wallet',size: SizeConfig.textMultiplier*2,),
                  onTap: (){
                  },
                ),
                const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20),
                  child:  Divider(),
                ),
                ListTile(
                  leading: const Icon(CupertinoIcons.exclamationmark_circle,color: Colors.black,size: 25,),
                  title: TextView(text: 'About',size: SizeConfig.textMultiplier*2,),
                  onTap: (){
                  },
                ),
                const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20),
                  child:  Divider(),
                ),
                ListTile(
                  leading: const Icon(Icons.local_police_outlined,color: Colors.black,size: 25,),
                  title: TextView(text: 'Legal and Policies',size: SizeConfig.textMultiplier*2,),
                  onTap: (){
                  },
                ),
                const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20),
                  child:  Divider(),
                ),
                ListTile(
                  leading: const Icon(CupertinoIcons.question_circle,color: Colors.black,size: 25,),
                  title: TextView(text: 'Help & Feedback',size: SizeConfig.textMultiplier*2,),
                  onTap: (){
                  },
                ),
                const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20),
                  child:  Divider(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
