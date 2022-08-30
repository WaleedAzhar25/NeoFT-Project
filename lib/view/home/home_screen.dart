import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft/models/sellers_model.dart';
import 'package:nft/models/trending_collection_model.dart';
import 'package:nft/utils/TextView.dart';
import 'package:nft/utils/colors.dart';
import 'package:nft/utils/size_config.dart';
import 'package:nft/view/chat/chat_screen.dart';
import 'package:nft/view/home/notifications.dart';
import 'package:nft/view/home/trending_collections.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool chip1 = true;
  bool chip2 = false;
  bool chip3 = false;
  bool chip4 = false;
  bool chip5 = false;
  bool chip6 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: SizeConfig.heightMultiplier * 8,
        backgroundColor: Colors.white12,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage('assets/images/etherium.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextView(
                  text: '192,20 ETH',
                  size: SizeConfig.textMultiplier * 2,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border(
                    left: BorderSide(color: Colors.black12),
                    right: BorderSide(color: Colors.black12),
                    bottom: BorderSide(color: Colors.black12),
                    top: BorderSide(color: Colors.black12),
                  )
                ),
                child: IconButton(
                  onPressed: () {
                    Get.to(const ChatScreen());
                  },
                  icon:const Icon(
                      CupertinoIcons.chat_bubble,
                    color: Colors.black,
                    size: 28,
                  )
                ),
              ),
              SizedBox(
                height: 70,
                width: 70,
                child: IconButton(
                  onPressed: () {
                    Get.to(const NotificationScreen());
                  },
                  icon: Image.asset(
                    "assets/images/notification.png",
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: TextView(
                  text: 'Top Sellers',
                  fontWeight: FontWeight.w700,
                  size: SizeConfig.textMultiplier * 2.5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                  height: SizeConfig.heightMultiplier * 10,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: listSeller.length,
                      itemBuilder: (BuildContext context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            width: SizeConfig.widthMultiplier * 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: const Border(
                                top: BorderSide(color: Colors.black12),
                                left: BorderSide(color: Colors.black12),
                                bottom: BorderSide(color: Colors.black12),
                                right: BorderSide(color: Colors.black12),
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: SizeConfig.heightMultiplier*14,
                                    width: SizeConfig.widthMultiplier*15,
                                    decoration:  BoxDecoration(
                                        image: DecorationImage(image: AssetImage(listSeller[index].image.toString()),)
                                    ),
                                  ),

                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: TextView(
                                          text:
                                              listSeller[index].name.toString(),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      TextView(
                                        text:
                                            listSeller[index].price.toString(),
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Divider(
                  thickness: 5,
                  color: Colors.black12.withOpacity(0.1),
                ),
              ),
              const SeeAll(),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 5),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ChoiceChip(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        label: Text('Trending',
                            style: chip1 == false
                                ? const TextStyle(color: Colors.black38)
                                : const TextStyle(color: Colors.white)),
                        selected: chip1,
                        selectedColor: Colors.black,
                        onSelected: (bool selected) {
                          setState(() {
                            chip1 = selected;
                            chip2 = false;
                            chip3 = false;
                            chip4 = false;
                            chip5 = false;
                            chip6 = false;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ChoiceChip(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          label: Text('Art',
                              style: chip2 == false
                                  ? const TextStyle(color: Colors.black38)
                                  : const TextStyle(color: Colors.white)),
                          selected: chip2,
                          selectedColor: Colors.black,
                          onSelected: (bool selected) {
                            setState(() {
                              chip1 = false;
                              chip2 = selected;
                              chip3 = false;
                              chip4 = false;
                              chip5 = false;
                              chip6 = false;
                            });
                          },
                        ),
                      ),
                      ChoiceChip(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        label: Text('Music',
                            style: chip3 == false
                                ? const TextStyle(color: Colors.black38)
                                : const TextStyle(color: Colors.white)),
                        selected: chip3,
                        selectedColor: Colors.black,
                        onSelected: (bool selected) {
                          setState(() {
                            chip3 = selected;
                            chip2 = false;
                            chip1 = false;
                            chip4 = false;
                            chip5 = false;
                            chip6 = false;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ChoiceChip(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          label: Text('3D Games',
                              style: chip4 == false
                                  ? const TextStyle(color: Colors.black38)
                                  : const TextStyle(color: Colors.white)),
                          selected: chip4,
                          selectedColor: Colors.black,
                          onSelected: (bool selected) {
                            setState(() {
                              chip1 = false;
                              chip2 = false;
                              chip3 = false;
                              chip4 = selected;
                              chip5 = false;
                              chip6 = false;
                            });
                          },
                        ),
                      ),
                      ChoiceChip(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        label: Text('Online Game',
                            style: chip5 == false
                                ? const TextStyle(color: Colors.black38)
                                : const TextStyle(color: Colors.white)),
                        selected: chip5,
                        selectedColor: Colors.black,
                        onSelected: (bool selected) {
                          setState(() {
                            chip1 = false;
                            chip2 = false;
                            chip3 = false;
                            chip4 = false;
                            chip5 = selected;
                            chip6 = false;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ChoiceChip(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          label: Text('Sports',
                              style: chip6 == false
                                  ? const TextStyle(color: Colors.black38)
                                  : const TextStyle(color: Colors.white)),
                          selected: chip6,
                          selectedColor: Colors.black,
                          onSelected: (bool selected) {
                            setState(() {
                              chip1 = false;
                              chip2 = false;
                              chip3 = false;
                              chip4 = false;
                              chip5 = false;
                              chip6 = selected;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20,bottom: 20),
                child: SizedBox(
                  height: SizeConfig.heightMultiplier * 52,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: listTrendingCollection.length,
                      itemBuilder: (BuildContext context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: (){
                              Get.to(const TrendingCollectionsScreen());
                            },
                            child: Container(
                              width: SizeConfig.widthMultiplier * 65,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: const Border(
                                  top: BorderSide(color: Colors.black12),
                                  left: BorderSide(color: Colors.black12),
                                  bottom: BorderSide(color: Colors.black12),
                                  right: BorderSide(color: Colors.black12),
                                ),
                                color: Colors.white,
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: SizeConfig.heightMultiplier * 30,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    listTrendingCollection[index]
                                                        .image
                                                        .toString()),
                                                fit: BoxFit.fill)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextView(
                                          text:
                                              listTrendingCollection[index].title,
                                          size: SizeConfig.textMultiplier * 2,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 5),
                                        child: TextView(
                                          text: listTrendingCollection[index].tag,
                                          size: SizeConfig.textMultiplier * 1.9,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black38,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, top: 10),
                                        child: TextView(
                                          text: listTrendingCollection[index]
                                              .etherium,
                                          size: SizeConfig.textMultiplier * 2,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Row(
                                          children: [
                                            TextView(
                                              text: 'Highest bid',
                                              size:
                                                  SizeConfig.textMultiplier * 1.5,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black38,
                                            ),
                                            const Spacer(),
                                            IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    listTrendingCollection[index]
                                                            .check =
                                                        !listTrendingCollection[
                                                                index]
                                                            .check;
                                                  });
                                                },
                                                icon:
                                                    listTrendingCollection[index]
                                                                .check ==
                                                            false
                                                        ? const Icon(
                                                            Icons
                                                                .favorite_border_outlined,
                                                            size: 28,
                                                          )
                                                        : Icon(
                                                            Icons.favorite_sharp,
                                                            size: 28,
                                                            color: primaryColor,
                                                          )),
                                            TextView(
                                              text: listTrendingCollection[index]
                                                  .favourite
                                                  .toString(),
                                              color: Colors.black38,
                                              fontWeight: FontWeight.w500,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        );
                      }),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class SeeAll extends StatelessWidget {
  const SeeAll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextView(
            text: 'Trending Collection',
            size: SizeConfig.textMultiplier * 2.2,
            fontWeight: FontWeight.w700,
          ),
          TextButton(
              onPressed: () {
                Get.to(const TrendingCollectionsScreen());
              },
              child: Row(
                children: [
                  TextView(
                    text: 'See all ',
                    color: primaryColor,
                    size: 15,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: primaryColor,
                    size: 18,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
