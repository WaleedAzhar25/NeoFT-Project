import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft/utils/auth_input_text_field.dart';
import 'package:nft/utils/colors.dart';
import '../../utils/TextView.dart';
import '../../utils/buttons.dart';
import '../../utils/size_config.dart';

class MessageScreen extends StatefulWidget {
  final String image;
  final String name;

  const MessageScreen({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController messageController = TextEditingController();
  ScrollController? controller;
  List messages = [];
  @override
  void initState() {
    // TODO: implement initState
    controller = ScrollController();
    controller!.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    setState(() {
      messageController.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Back(
                            buttonColor: Colors.white,
                            iconColor: Colors.black,
                            elevation: 0.1,
                            onTap: () {
                              Get.back();
                            }),
                        Container(
                          height: SizeConfig.heightMultiplier * 8.5,
                          width: SizeConfig.widthMultiplier * 18,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(widget.image),
                            fit: BoxFit.fill,
                          )),
                        ),
                        Back(
                            padding: 0,
                            elevation: 0.1,
                            buttonColor: Colors.white,
                            iconColor: Colors.black,
                            icon: Icons.more_vert,
                            onTap: () {}),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextView(
                      text: widget.name,
                      size: SizeConfig.textMultiplier * 2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Divider(
                      thickness: 1,
                      color: Colors.blueGrey.withOpacity(0.15),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        controller: controller,
                        itemCount: messages.length+1,
                        itemBuilder: (BuildContext context, index) {
                          if(index==messages.length){
                            return Container(height: 50,);
                          }
                          return messages.isEmpty
                              ? Container()
                              : messageContainer(index);
                        }),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 50), child: Text(""))
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: textField(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row textField() {
    return Row(
      children: [
        SizedBox(
          width: SizeConfig.widthMultiplier * 78,
          height: SizeConfig.heightMultiplier * 5.5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: AuthTextInputField(
                hintSize: 12,
                radius: 30,
                textInputAction: TextInputAction.done,
                leftPadding: 20,
                textEditingController: messageController,
                onSubmitted: (value) {
                  if(messageController.text.characters.isEmpty || messageController.text.trim()==''){

                  }
                  else {
                    setState(() {
                      controller!.jumpTo(controller!.position.maxScrollExtent);
                      messages.add(value!.trim().toString());
                      messageController.clear();
                    });
                  }
                  return null;
                },
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      if(messageController.text.isEmpty|| messageController.text.trim()==''){

                      }else {
                        setState(() {
                          controller!
                              .jumpTo(controller!.position.maxScrollExtent);
                          messages.add(messageController.text.trim().toString());
                          messageController.clear();
                        });
                      }
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(40)),
                      child: const Center(
                          child: Icon(
                        Icons.send_rounded,
                        color: Colors.white,
                        size: 15,
                      )),
                    ),
                  ),
                ),
                fillColor: Colors.blueGrey.withOpacity(0.15),
                focusBorderColor: Colors.white,
                bordercolor: Colors.white,
                hintText: 'Type your message..'),
          ),
        ),
        Back(
            buttonColor: Colors.white.withOpacity(0.6),
            elevation: 0.1,
            borderColor: Colors.white.withOpacity(0.6),
            iconColor: primaryColor,
            padding: 0,
            icon: Icons.mic,
            onTap: () {})
      ],
    );
  }

  Padding messageContainer(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.only(left: 80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    messages[index].toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
