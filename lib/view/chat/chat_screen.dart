import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:nft/models/chat_model.dart';
import 'package:nft/utils/colors.dart';
import 'package:nft/view/chat/message_screen.dart';
import '../../utils/TextView.dart';
import '../../utils/buttons.dart';
import '../../utils/size_config.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          elevation: 2,
          backgroundColor: primaryColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 35,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              const Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20),
                child: Title(),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: listChatModel.length,
                      itemBuilder: (BuildContext context, index) {
                        return chatList(index);
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding chatList(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20),
      child: Column(
        children: [
          Slidable(
            key: const ValueKey(0),
            endActionPane: const ActionPane(
              extentRatio: 0.2,
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  onPressed: null,
                  backgroundColor: Color(0xfffecfd5),
                  foregroundColor: Color(0xFFFE4A49),
                  icon: CupertinoIcons.delete,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                onTap: (){
                  Get.to(MessageScreen(image: listChatModel[index].image, name: listChatModel[index].name));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                leading: Container(
                  height: SizeConfig.heightMultiplier * 14,
                  width: SizeConfig.widthMultiplier * 15,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(listChatModel[index].image),
                  )),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      listChatModel[index].name,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        listChatModel[index].tag,
                        style: const TextStyle(
                          color: Colors.black38,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      listChatModel[index].time,
                      style: TextStyle(
                          fontSize: SizeConfig.textMultiplier * 1.5,
                          color: Colors.black38),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 20,
                          width: 25,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                              child: Text(
                            listChatModel[index].notification.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ))),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Divider(
              thickness: 1,
              color: Colors.blueGrey.withOpacity(0.1),
            ),
          )
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
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
          text: "Chat",
          size: SizeConfig.textMultiplier * 3,
          fontWeight: FontWeight.w500,
        ),
        Back(
            padding: 0,
            buttonColor: Colors.white,
            iconColor: Colors.black,
            icon: Icons.search_rounded,
            onTap: () {}),
      ],
    );
  }
}
