import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft/utils/TextView.dart';
import 'package:nft/utils/buttons.dart';
import 'package:nft/utils/colors.dart';
import 'package:nft/utils/size_config.dart';
import 'package:nft/view/profile/setting_profile.dart';
import '../../models/trending_collection_model.dart';
import '../home/trending_collections.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  bool follow = false;
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: 100 * SizeConfig.heightMultiplier,
          width: 100 * SizeConfig.widthMultiplier,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProfileTitle(),
                  const DPWithBackground(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        child: TextView(
                          text: 'Wade Warren',
                          size: SizeConfig.textMultiplier * 2.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Image.asset(
                        'assets/images/checkmark.png',
                        height: 25,
                        width: 25,
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextView(
                      text: '@WadeWarren',
                      size: SizeConfig.textMultiplier * 2,
                      fontWeight: FontWeight.w400,
                      color: Colors.black38,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 5),
                    child: Align(
                      alignment: Alignment.center,
                      child: TextView(
                        text: 'Lorem ipsum dolor sit amet, consectetur',
                        size: SizeConfig.textMultiplier * 1.8,
                        fontWeight: FontWeight.w400,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: TextView(
                        text: 'adipiscing elit.',
                        size: SizeConfig.textMultiplier * 1.8,
                        fontWeight: FontWeight.w400,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 4,
                    color: Colors.blueGrey.withOpacity(0.1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        follow == false
                            ? PrimaryButton(
                                text: 'Follow',
                                radius: 8,
                                textSize: 14,
                                color: primaryColor,
                                onTap: () {
                                  setState(() {
                                    follow = !follow;
                                  });
                                },
                                textColor: Colors.white,
                                borderColor: primaryColor,
                                contentPadding: 1,
                              )
                            : PrimaryButton(
                                text: 'Following',
                                radius: 8,
                                textSize: 14,
                                color: Colors.white,
                                onTap: () {
                                  setState(() {
                                    follow = !follow;
                                  });
                                },
                                textColor: primaryColor,
                                borderColor: primaryColor,
                                contentPadding: 1,
                              ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary:
                                      const Color.fromARGB(200, 249, 249, 249),
                                  elevation: 1),
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: RichText(
                                  text:  TextSpan(children: [
                                    TextSpan(
                                        text: '10k',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: SizeConfig.textMultiplier*1.5)),
                                    TextSpan(
                                        text: ' Followers',
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: SizeConfig.textMultiplier*1.5,
                                            fontWeight: FontWeight.w400))
                                  ]),
                                ),
                              )),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary:
                                    const Color.fromARGB(200, 249, 249, 249),
                                elevation: 1),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: RichText(
                                text:  TextSpan(children: [
                                  TextSpan(
                                      text: '10k',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: SizeConfig.textMultiplier*1.5)),
                                  TextSpan(
                                      text: ' Following',
                                      style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: SizeConfig.textMultiplier*1.5,
                                          fontWeight: FontWeight.w400))
                                ]),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      TabBar(
                        unselectedLabelColor: Colors.black38,
                        labelColor: Colors.black,
                        tabs: const [
                          Tab(
                            text: 'Collections',
                          ),
                          Tab(
                            text: 'Activity',
                          )
                        ],
                        controller: _tabController,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: primaryColor,
                        indicatorWeight: 3,
                        padding: const EdgeInsets.only(bottom: 7),
                      ),
                      const Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 20,
                            left: 20,
                          ),
                          child: Divider(
                            thickness: 1,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: SizedBox(
                      width: SizeConfig.widthMultiplier * 100,
                      height: 300,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          buildListView,
                          buildListView,
                        ],
                      ),
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

  ListView get buildListView {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: listTrendingCollection.length,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20, top: 12, bottom: 12,left: 20),
            child: GestureDetector(
              onTap: () {
                Get.to(const TrendingCollectionsScreen());
              },
              child: Container(
                width: SizeConfig.widthMultiplier * 100,
                height: SizeConfig.heightMultiplier * 60,
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
                          height: SizeConfig.heightMultiplier * 40,
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
                            text: listTrendingCollection[index].title,
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
                          padding: const EdgeInsets.only(left: 8, top: 10),
                          child: TextView(
                            text: listTrendingCollection[index].etherium,
                            size: SizeConfig.textMultiplier * 2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              TextView(
                                text: 'Highest bid',
                                size: SizeConfig.textMultiplier * 1.5,
                                fontWeight: FontWeight.w500,
                                color: Colors.black38,
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      listTrendingCollection[index].check =
                                          !listTrendingCollection[index].check;
                                    });
                                  },
                                  icon: listTrendingCollection[index].check ==
                                          false
                                      ? const Icon(
                                          Icons.favorite_border_outlined,
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
        });
  }
}

class DPWithBackground extends StatelessWidget {
  const DPWithBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 20, right: 20, top: 30),
      child: SizedBox(
        height: SizeConfig.heightMultiplier * 19,
        width: SizeConfig.widthMultiplier * 100,
        child: Stack(
          children: [
            Image.asset("assets/images/profile_background.png"),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage:
                        AssetImage("assets/images/profile.png"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileTitle extends StatelessWidget {
  const ProfileTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Back(
              buttonColor: Colors.white,
              iconColor: Colors.black,
              onTap: () {
                Get.back();
              }),
          const Spacer(),
          TextView(
            text: "Profile",
            size: SizeConfig.textMultiplier * 2.5,
            fontWeight: FontWeight.w600,
          ),
          const Spacer(),
          Back(
              buttonColor: Colors.white,
              iconColor: Colors.black,
              icon: Icons.settings_outlined,
              padding: 0,
              size: 28,
              onTap: () {
                Get.to(const SettingProfile());
              }),
        ],
      ),
    );
  }
}
