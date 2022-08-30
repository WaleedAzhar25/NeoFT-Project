import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft/controllers/explore_controller.dart';
import 'package:nft/utils/TextView.dart';
import 'package:nft/utils/size_config.dart';
import '../../models/trending_collection_model.dart';
import '../../utils/buttons.dart';
import '../../utils/colors.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  ExploreController controller = Get.put(ExploreController());
  int listLength = listTrendingCollection.length;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 20),
              child: Row(
                children: [
                  TextView(
                    text: 'Explore',
                    size: SizeConfig.textMultiplier * 2.5,
                    fontWeight: FontWeight.w600,
                  ),
                  const Spacer(),
                  // Back(
                  //   buttonColor: Colors.white,
                  //   padding: 0,
                  //   onTap: () {
                  //     Get.back();
                  //   },
                  //   iconColor: Colors.black87,
                  //   icon: Icons.filter_alt_outlined,
                  //   borderColor: Colors.white,
                  //   size: 25,
                  // ),
                ],
              ),
            ),
            CustomTabBar(tabController: _tabController),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                        itemCount: listTrendingCollection.length,
                        gridDelegate:
                            const  SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.5,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          controller.setIndex.value = index;
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: GestureDetector(
                              onTap: () {
                                // Get.to(DetailTrendingScreen(image: listTrendingCollection[index].image, title: listTrendingCollection[index].title, tag: listTrendingCollection[index].tag,favourite: listTrendingCollection[index].check, likes: listTrendingCollection[index].favourite,));
                              },
                              child: Container(
                                // height:800,
                                //        width: 200,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height:
                                              SizeConfig.heightMultiplier * 20,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      listTrendingCollection[
                                                              index]
                                                          .image
                                                          .toString()),
                                                  fit: BoxFit.fill)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextView(
                                            text: listTrendingCollection[index]
                                                .title,
                                            size:
                                                SizeConfig.textMultiplier * 1.8,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 5),
                                          child: TextView(
                                            text: listTrendingCollection[index]
                                                .tag,
                                            size:
                                                SizeConfig.textMultiplier * 1.7,
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
                                            size:
                                                SizeConfig.textMultiplier * 1.8,
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
                                                    SizeConfig.textMultiplier *
                                                        1.4,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black38,
                                              ),
                                              const Spacer(),
                                              IconButton(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20),
                                                  onPressed: () {
                                                    setState(() {
                                                      listTrendingCollection[
                                                                  index]
                                                              .check =
                                                          !listTrendingCollection[
                                                                  index]
                                                              .check;
                                                    });
                                                  },
                                                  icon: listTrendingCollection[
                                                                  index]
                                                              .check ==
                                                          false
                                                      ? const Icon(
                                                          Icons
                                                              .favorite_border_outlined,
                                                          size: 24,
                                                        )
                                                      : Icon(
                                                          Icons.favorite_sharp,
                                                          size: 24,
                                                          color: primaryColor,
                                                        )),
                                              TextView(
                                                text: listTrendingCollection[
                                                        index]
                                                    .favourite
                                                    .toString(),
                                                color: Colors.black38,
                                                fontWeight: FontWeight.w500,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                            ),
                          );
                        }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: listTrendingCollection.length,
                      gridDelegate:
                      const  SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.5,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        controller.setIndex.value = index;
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: GestureDetector(
                            onTap: () {
                              // Get.to(DetailTrendingScreen(image: listTrendingCollection[index].image, title: listTrendingCollection[index].title, tag: listTrendingCollection[index].tag,favourite: listTrendingCollection[index].check, likes: listTrendingCollection[index].favourite,));
                            },
                            child: Container(
                              // height:800,
                              //        width: 200,
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
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height:
                                        SizeConfig.heightMultiplier * 20,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    listTrendingCollection[
                                                    index]
                                                        .image
                                                        .toString()),
                                                fit: BoxFit.fill)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextView(
                                          text: listTrendingCollection[index]
                                              .title,
                                          size:
                                          SizeConfig.textMultiplier * 1.8,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 5),
                                        child: TextView(
                                          text: listTrendingCollection[index]
                                              .tag,
                                          size:
                                          SizeConfig.textMultiplier * 1.7,
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
                                          size:
                                          SizeConfig.textMultiplier * 1.8,
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
                                              SizeConfig.textMultiplier *
                                                  1.4,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black38,
                                            ),
                                            const Spacer(),
                                            IconButton(
                                                padding:
                                                const EdgeInsets.only(
                                                    left: 20),
                                                onPressed: () {
                                                  setState(() {
                                                    listTrendingCollection[
                                                    index]
                                                        .check =
                                                    !listTrendingCollection[
                                                    index]
                                                        .check;
                                                  });
                                                },
                                                icon: listTrendingCollection[
                                                index]
                                                    .check ==
                                                    false
                                                    ? const Icon(
                                                  Icons
                                                      .favorite_border_outlined,
                                                  size: 24,
                                                )
                                                    : Icon(
                                                  Icons.favorite_sharp,
                                                  size: 24,
                                                  color: primaryColor,
                                                )),
                                            TextView(
                                              text: listTrendingCollection[
                                              index]
                                                  .favourite
                                                  .toString(),
                                              color: Colors.black38,
                                              fontWeight: FontWeight.w500,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        );
                      }),
                ),
              ]),
            )
          ],
        ),
      )),
    );
  }
}

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TabBar(
          unselectedLabelColor: Colors.black38,
          labelColor: Colors.black,
          tabs: const [
            Tab(
              text: 'Popular',
            ),
            Tab(
              text: 'Following',
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
              thickness: 2,
            ),
          ),
        )
      ],
    );
  }
}
