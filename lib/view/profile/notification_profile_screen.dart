import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/TextView.dart';
import '../../utils/buttons.dart';
import '../../utils/size_config.dart';
class NotificationProfileScreen extends StatefulWidget {
  const NotificationProfileScreen({Key? key}) : super(key: key);

  @override
  State<NotificationProfileScreen> createState() => _NotificationProfileScreenState();
}

class _NotificationProfileScreenState extends State<NotificationProfileScreen> {
  bool isChecked = false;
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Back(
                        buttonColor: Colors.white,
                        iconColor: Colors.black,
                        onTap: () {
                          Get.back();
                        }),
                    TextView(
                      text: "Notification",
                      size: SizeConfig.textMultiplier * 2.5,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(width: 40,),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextView(
                    text: 'Message Notification',
                    size: SizeConfig.textMultiplier*1.7,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ListTile(
                  leading:TextView(text: 'Show Notifications',size: SizeConfig.textMultiplier*2,),
                  trailing:Switch(
                    activeColor: Colors.lightGreen,
                    inactiveTrackColor: Colors.black12,
                    activeTrackColor: Colors.black12,
                    value: isChecked,
                    onChanged: (bool value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                  ),
                  onTap: (){
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                ),
                const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20),
                  child:  Divider(),
                ),
                ListTile(
                  leading:TextView(text: 'Exceptions',size: SizeConfig.textMultiplier*2,),
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
