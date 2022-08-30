import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft/auth/controller/auth_controller.dart';
import 'package:nft/auth/model/wallets_model.dart';
import 'package:nft/auth/view/loginScreen.dart';
import 'package:nft/utils/TextView.dart';
import 'package:nft/utils/colors.dart';
import 'package:nft/utils/size_config.dart';

import '../../utils/buttons.dart';
class ChooseWallet extends StatefulWidget {
  const ChooseWallet({Key? key}) : super(key: key);

  @override
  State<ChooseWallet> createState() => _ChooseWalletState();
}

class _ChooseWalletState extends State<ChooseWallet> {
  AuthController controller= Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Back(
                          buttonColor: Colors.white,
                          iconColor: Colors.black54,
                          onTap: (){
                            Get.back();
                          }),
                      TextView(
                          text: "Choose Wallet",
                      size: SizeConfig.textMultiplier*2.8,
                        fontWeight: FontWeight.w700,
                      ),
                      const SizedBox(width: 10,),

                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Obx(()=>
                   ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.length.value,
                      itemBuilder:(BuildContext context,index){
                  return Column(
                    children: [
                      ListTile(
                        onTap: (){

                        },
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(listWallet[index].image.toString()),
                          backgroundColor: Colors.white,
                        ),
                        title: TextView(text: listWallet[index].title.toString(),
                        size: SizeConfig.textMultiplier*2,
                          fontWeight: FontWeight.w500,
                        ),
                        trailing: TextView(text: listWallet[index].popular.toString(),
                          color: Colors.greenAccent.withOpacity(1),
                        size: SizeConfig.textMultiplier*1.8,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                     const Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 15),
                        child: Divider(
                          thickness: 1,

                        ),
                      ),
                    ],
                  );
                  }
        ),
                ),
                Obx(()=>
                   Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: controller.length.value==4?GestureDetector(
                      onTap: (){
                          controller.length.value=listWallet.length;
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          TextView(text: "See more Options",
                          color: primaryColor,
                          ),
                          Icon(Icons.keyboard_arrow_down_rounded,color: primaryColor,)
                        ],
                      ),
                    ):
                       GestureDetector(
                        onTap: (){
                            controller.length.value=4;
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            TextView(text: "See Fewer Options",
                              color: primaryColor,
                            ),
                            Icon(Icons.keyboard_arrow_up_rounded,color: primaryColor,)
                          ],
                        ),
                      ),
                    ),
                ),
                   Obx(()=>
                      SizedBox(
                      height: controller.length.value==4?SizeConfig.heightMultiplier*26:SizeConfig.heightMultiplier*10,
                  ),
                   ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(
                            text: "Connect Wallet",
                            color: primaryColor,
                            onTap: (){
                              Get.offAll(const LoginScreen());
                            },
                            textColor: Colors.white,
                            borderColor: primaryColor),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: (){
                      Get.offAll(const LoginScreen());
                    },
                    child: Text(
                      "Skip for now",
                      style: TextStyle(color: primaryColor,
                      fontSize: SizeConfig.textMultiplier*2
                      ),
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
