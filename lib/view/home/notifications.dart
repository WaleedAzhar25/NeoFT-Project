import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft/utils/TextView.dart';
import 'package:nft/utils/colors.dart';
import 'package:nft/utils/size_config.dart';
import '../../utils/buttons.dart';
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool follow=false;
  bool follow1=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Back(
                        iconColor: Colors.black,
                        buttonColor: Colors.white,
                        onTap: () {
                          Get.back();
                          },
                      ),
                       TextView(
                          text: "Notification",
                      size: SizeConfig.textMultiplier*3,
                         fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(width: 20,),
                    ],
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                  child: TextView(
                      text: "Today",
                  size: SizeConfig.textMultiplier*2.2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: SizedBox(
                      height: SizeConfig.heightMultiplier*8,
                      child: Row(
                        children: [
                          Container(
                            height: SizeConfig.heightMultiplier*14,
                            width: SizeConfig.widthMultiplier*15,
                            decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/images/notification1.png'),)
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                    text:  TextSpan(
                                        children: [
                                          TextSpan(text: 'Jane',style: TextStyle(color: Colors.black,fontSize: SizeConfig.textMultiplier*1.6)),
                                          TextSpan(text: ' Followed ',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: SizeConfig.textMultiplier*1.6)),
                                          TextSpan(text: 'you.',style: TextStyle(color: Colors.black,fontSize: SizeConfig.textMultiplier*1.6)),

                                        ]
                                    )),
                                 Spacer(),
                                 TextView(
                                    text: "2 hours Ago",
                                 size: SizeConfig.textMultiplier*1.5,
                                  color: Colors.black38,
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          follow==false? PrimaryButton(
                            text: 'Follow',
                            radius: 8,
                            textSize: 14,
                            color: primaryColor,
                            onTap: (){
                              setState((){
                                follow=!follow;
                              });
                            },
                            textColor: Colors.white,
                            borderColor: primaryColor,
                            contentPadding: 1,
                          ):PrimaryButton(
                            text: 'Following',
                            radius: 8,
                            textSize: 14,
                            color: Colors.white,
                            onTap: (){
                              setState((){
                                follow=!follow;
                              });
                            },
                            textColor: primaryColor,
                            borderColor: primaryColor,
                            contentPadding: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                const Padding(
                  padding:  EdgeInsets.only(left: 80,right: 20,top: 5),
                  child: Divider(thickness: 1,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                  child: SizedBox(
                    height: SizeConfig.heightMultiplier*10,
                    child: Row(
                      children: [
                        Container(
                          height: SizeConfig.heightMultiplier*14,
                          width: SizeConfig.widthMultiplier*15,
                          decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/images/notification2.png'),)
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15,top: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text:  TextSpan(
                                      children: [
                                        TextSpan(text: 'New bid ',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: SizeConfig.textMultiplier*1.6)),
                                        TextSpan(text: 'already added\nto market place.',style: TextStyle(color: Colors.black,fontSize: SizeConfig.textMultiplier*1.6)),

                                      ]
                                  )),

                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: TextView(
                                  text: "2 hours Ago",
                                  size: SizeConfig.textMultiplier*1.5,
                                  color: Colors.black38,
                                ),
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        PrimaryButton(
                          text: 'Add a bid',
                          color: Colors.white,
                          onTap: (){

                          },
                          contentPadding: 4,
                          textColor: primaryColor,
                          borderColor: primaryColor,
                          textSize: 14,
                          radius: 8,
                        )

                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding:  EdgeInsets.only(left: 80,right: 20,top: 5),
                  child: Divider(thickness: 1,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                  child: SizedBox(
                    height: SizeConfig.heightMultiplier*10,
                    child: Row(
                      children: [
                        Container(
                          height: SizeConfig.heightMultiplier*14,
                          width: SizeConfig.widthMultiplier*15,
                          decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/images/notification1.png'),)
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15,top: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text:  TextSpan(
                                      children: [
                                        TextSpan(text: 'Jane',style: TextStyle(color: Colors.black,fontSize: SizeConfig.textMultiplier*1.6)),
                                        TextSpan(text: ' added ',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: SizeConfig.textMultiplier*1.6)),
                                        TextSpan(text: 'a new NFT\nfor sell.',style: TextStyle(color: Colors.black,fontSize: SizeConfig.textMultiplier*1.6)),

                                      ]
                                  )),

                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: TextView(
                                  text: "2 hours Ago",
                                  size: SizeConfig.textMultiplier*1.5,
                                  color: Colors.black38,
                                ),
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: SizeConfig.heightMultiplier*15,
                          width: SizeConfig.widthMultiplier*16,
                          decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/images/notification3.png'),)
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                  child: TextView(
                    text: "Yesterday",
                    size: SizeConfig.textMultiplier*2.2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: SizedBox(
                    height: SizeConfig.heightMultiplier*8,
                    child: Row(
                      children: [
                        Container(
                          height: SizeConfig.heightMultiplier*14,
                          width: SizeConfig.widthMultiplier*15,
                          decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/images/notification4.png'),)
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text:  TextSpan(
                                      children: [
                                        TextSpan(text: 'Alex',style: TextStyle(color: Colors.black,fontSize: SizeConfig.textMultiplier*1.6)),
                                        TextSpan(text: ' Followed ',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: SizeConfig.textMultiplier*1.6)),
                                        TextSpan(text: 'you.',style: TextStyle(color: Colors.black,fontSize: SizeConfig.textMultiplier*1.6)),

                                      ]
                                  )),
                              Spacer(),
                              TextView(
                                text: "2 Days Ago",
                                size: SizeConfig.textMultiplier*1.5,
                                color: Colors.black38,
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        follow1==false? PrimaryButton(
                          text: 'Follow',
                          radius: 8,
                          textSize: 14,
                          color: primaryColor,
                          onTap: (){
                            setState((){
                              follow1=!follow1;
                            });
                          },
                          textColor: Colors.white,
                          borderColor: primaryColor,
                          contentPadding: 1,
                        ):PrimaryButton(
                          text: 'Following',
                          radius: 8,
                          textSize: 14,
                          color: Colors.white,
                          onTap: (){
                            setState((){
                              follow1=!follow1;
                            });
                          },
                          textColor: primaryColor,
                          borderColor: primaryColor,
                          contentPadding: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding:  EdgeInsets.only(left: 80,right: 20,top: 5),
                  child: Divider(thickness: 1,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                  child: SizedBox(
                    height: SizeConfig.heightMultiplier*10,
                    child: Row(
                      children: [
                        Container(
                          height: SizeConfig.heightMultiplier*14,
                          width: SizeConfig.widthMultiplier*15,
                          decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/images/notification2.png'),)
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15,top: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text:  TextSpan(
                                      children: [
                                        TextSpan(text: 'New bid ',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: SizeConfig.textMultiplier*1.6)),
                                        TextSpan(text: 'already added\nto market place.',style: TextStyle(color: Colors.black,fontSize: SizeConfig.textMultiplier*1.6)),

                                      ]
                                  )),

                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: TextView(
                                  text: "2 Days Ago",
                                  size: SizeConfig.textMultiplier*1.5,
                                  color: Colors.black38,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        PrimaryButton(
                          text: 'Add a bid',
                          color: Colors.white,
                          onTap: (){

                          },
                          contentPadding: 4,
                          textColor: primaryColor,
                          borderColor: primaryColor,
                          textSize: 14,
                          radius: 8,
                        )

                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding:  EdgeInsets.only(left: 80,right: 20,top: 5),
                  child: Divider(thickness: 1,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                  child: SizedBox(
                    height: SizeConfig.heightMultiplier*10,
                    child: Row(
                      children: [
                        Container(
                          height: SizeConfig.heightMultiplier*14,
                          width: SizeConfig.widthMultiplier*15,
                          decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/images/etherium.png'),)
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15,top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text:  TextSpan(
                                      children: [
                                        TextSpan(text: '0.08 ETH',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: SizeConfig.textMultiplier*1.6)),
                                        TextSpan(text: ' received.',style: TextStyle(color: Colors.black,fontSize: SizeConfig.textMultiplier*1.6)),

                                      ]
                                  )),

                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: TextView(
                                  text: "2 Days Ago",
                                  size: SizeConfig.textMultiplier*1.5,
                                  color: Colors.black38,
                                ),
                              )
                            ],
                          ),
                        ),
                       
                      ],
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
