import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft/utils/TextView.dart';
import 'package:nft/utils/buttons.dart';
import 'package:nft/utils/colors.dart';
import 'package:nft/utils/size_config.dart';
import 'package:nft/view/home/trending_collections.dart';
import 'package:readmore/readmore.dart';
import 'package:intl/intl.dart';
import '../../models/sellers_model.dart';
import '../../models/trending_collection_model.dart';
class DetailTrendingScreen extends StatefulWidget  {
  final String image;
  final String title;
  final String tag;

  final String likes;
   bool favourite;
   DetailTrendingScreen({Key? key, required this.image, required this.title, required this.tag, required this.favourite, required this.likes,}) : super(key: key);

  @override
  State<DetailTrendingScreen> createState() => _DetailTrendingScreenState();
}

class _DetailTrendingScreenState extends State<DetailTrendingScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  bool follow=false;
  final num =  NumberFormat("#,##0", "en_US");

  int value=12220;
  increment(){
    setState((){
      value++;
    });
  }
  decrement(){
    setState((){
      value--;
    });
  }

  @override
  void initState() {
    _tabController =  TabController(length: 2,vsync:this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: SizeConfig.heightMultiplier*50,
              width: SizeConfig.widthMultiplier*100,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image:AssetImage(widget.image.toString()),
                  fit: BoxFit.fill
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 70),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Back(
                        buttonColor: Colors.white.withOpacity(0.3),
                        iconColor:Colors.white,
                        onTap: (){
                      Get.back();
                    }),
                    const Spacer(),
                    Back(
                        buttonColor: Colors.white.withOpacity(0.3),
                        iconColor:  widget.favourite==false?Colors.white:Colors.white,
                        icon:  widget.favourite==false?Icons.favorite_outline_sharp:Icons.favorite,
                        size: 28,
                        padding: 0,
                        onTap: (){
                          setState((){
                            widget.favourite=!widget.favourite;
                          });
                        }),
                    Back(
                        buttonColor: Colors.white.withOpacity(0.3),
                        iconColor:  Colors.white,
                        icon: Icons.more_vert,
                        size: 27,
                        padding: 0,
                        onTap: (){

                        }),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      TextView(
                          text: widget.title.toString(),
                      size: SizeConfig.textMultiplier*2.3,
                        fontWeight: FontWeight.w600,
                      ),
                      const Spacer(),
                      IconButton(
                          padding:const EdgeInsets.only(left: 20),
                          onPressed: (){
                        setState((){
                          widget.favourite=!widget.favourite;
                        });
                      },
                          icon:widget.favourite==false? const Icon(
                            Icons.favorite_outline_sharp,
                            size: 25,
                            color: Colors.black38,
                          ): Icon(
                            Icons.favorite,
                            size: 25,
                            color: primaryColor,
                          )
                      ),
                      TextView(text: widget.likes.toString(),),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: follow==false? PrimaryButton(
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
                      ),

                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: TextView(
                      text: 'Description',
                    size: SizeConfig.textMultiplier*2,
                    fontWeight: FontWeight.w500,),
                  ),
        const ReadMoreText(
          'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
          style: TextStyle(color: Colors.black38),
          trimLines: 3,
          colorClickableText: Colors.pink,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'More',
          trimExpandedText: 'Less',
          moreStyle:  TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          lessStyle:  TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(text: 'Created by',
                            size: SizeConfig.heightMultiplier*1.8,
                              fontWeight: FontWeight.w400,
                              color: Colors.black38,
                            ),
                           Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child:  Row(
                              children: [
                               const CircleAvatar(
                                  backgroundImage: AssetImage('assets/images/simon.png'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextView(
                                    text: widget.tag.toString(),
                                    size: SizeConfig.textMultiplier*1.8,
                                  fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          )
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(text: 'Owned by',
                              size: SizeConfig.heightMultiplier*1.8,
                              fontWeight: FontWeight.w400,
                              color: Colors.black38,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child:  Row(
                                children: [
                                  const CircleAvatar(
                                    backgroundImage: AssetImage('assets/images/ryan.png'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextView(
                                      text: '@Ryan Bergusan',
                                      size: SizeConfig.textMultiplier*1.8,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ) ,
            const Padding(
               padding:  EdgeInsets.symmetric(horizontal: 20),
               child: Divider(thickness: 1,),
             ),
            Stack(
              children: [
                TabBar(
                  unselectedLabelColor: Colors.black38,
                  labelColor: Colors.black,
                  tabs: const[
                    Tab(
                      text: 'Top bid',
                    ),
                    Tab(
                      text: 'Item activity',
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
                  child:  Padding(
                    padding:  EdgeInsets.only(right: 20,left: 20,),
                    child: Divider(thickness: 1,),
                  ),
                )

              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: SizedBox(
                width: SizeConfig.widthMultiplier*100,
                height: SizeConfig.heightMultiplier*80,
                child: buildTabBarView(),
              ),
            ),

          ],
        ),
      ),
    );
  }

  TabBarView buildTabBarView() {
    return TabBarView(
                controller: _tabController,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 10,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: listSeller.length,
                              itemBuilder: (BuildContext context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8),
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextView(
                                text: 'More collection',
                                size: SizeConfig.textMultiplier * 2.2,
                                fontWeight: FontWeight.w500,
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
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 50,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: listTrendingCollection.length,
                              itemBuilder: (BuildContext context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 10),
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
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                       const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PrimaryButton(
                                  text: '04:45:32',
                                  contentPadding: 14,
                                  color: Colors.white, onTap: (){

                              },
                                  textColor: Colors.black,
                                  borderColor: Colors.white),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20,right: 10),
                                  child: PrimaryButton(
                                    contentPadding: 14,
                                      radius: 8,
                                      textSize: 16,
                                      text: 'Place a Bid',
                                      color: primaryColor,
                                      onTap: (){
                                        Get.dialog(
                                            Scaffold(
                                              backgroundColor: Colors.transparent,
                                              body: Center(
                                                child: Container(
                                                  height: SizeConfig.heightMultiplier*70,
                                                  width: SizeConfig.widthMultiplier*80,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(12)
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
                                                    child: StatefulBuilder(
                                                      builder: (BuildContext context,StateSetter setState){
                                                        return Column(
                                                          children:  [
                                                            Padding(
                                                              padding: const EdgeInsets.symmetric(vertical: 10),
                                                              child: Row(
                                                                children: [
                                                                  Back(
                                                                    icon: CupertinoIcons.xmark,
                                                                    iconColor: Colors.black,
                                                                    size: 24,
                                                                    padding: 0,
                                                                    buttonColor: Colors.white,
                                                                    onTap: () {
                                                                      Get.back();
                                                                    },
                                                                  ),

                                                                  Padding(
                                                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                                                    child: TextView(
                                                                      text: widget.title.toString(),
                                                                      size: SizeConfig.textMultiplier*1.8,
                                                                      fontWeight: FontWeight.w600,
                                                                      color: Colors.black,

                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: SizeConfig.heightMultiplier*35,
                                                              width: SizeConfig.widthMultiplier*80,
                                                              child: Image.asset(widget.image.toString(),fit: BoxFit.fill,),

                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.symmetric(vertical: 12),
                                                              child: Row(
                                                                children: [
                                                                  TextView(
                                                                    text: 'Current Balance',
                                                                    size: SizeConfig.textMultiplier*1.6,
                                                                    color: Colors.black38,
                                                                  ),
                                                                  const Spacer(),
                                                                  RichText(text: TextSpan(
                                                                      children: [
                                                                        TextSpan(text: num.format(19220),
                                                                          style: TextStyle(
                                                                              fontSize: SizeConfig.textMultiplier*1.8,
                                                                              fontWeight: FontWeight.w600,
                                                                              color: Colors.black
                                                                          ),
                                                                        ),
                                                                        TextSpan(text: ' ETH',
                                                                          style: TextStyle(
                                                                              fontSize: SizeConfig.textMultiplier*1.4,
                                                                              fontWeight: FontWeight.w600,
                                                                              color: Colors.black
                                                                          ),
                                                                        )
                                                                      ]
                                                                  ))
                                                                ],
                                                              ),
                                                            ),
                                                            Row(
                                                              children: [
                                                                TextView(
                                                                  text: 'Highest bid',
                                                                  size: SizeConfig.textMultiplier*1.6,
                                                                  color: Colors.black38,
                                                                ),
                                                                const Spacer(),
                                                                RichText(text: TextSpan(
                                                                    children: [
                                                                      TextSpan(text: num.format(value),
                                                                        style: TextStyle(
                                                                            fontSize: SizeConfig.textMultiplier*1.8,
                                                                            fontWeight: FontWeight.w600,
                                                                            color: Colors.black
                                                                        ),
                                                                      ),
                                                                      TextSpan(text: ' ETH',
                                                                        style: TextStyle(
                                                                            fontSize: SizeConfig.textMultiplier*1.4,
                                                                            fontWeight: FontWeight.w600,
                                                                            color: Colors.black
                                                                        ),
                                                                      )
                                                                    ]
                                                                ))
                                                              ],
                                                            ),

                                                            Padding(
                                                              padding: const EdgeInsets.only(top: 10),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: Back(
                                                                        buttonColor: Colors.white,
                                                                        iconColor: Colors.black54,
                                                                        icon: Icons.minimize,
                                                                        padding: 0,
                                                                        onTap: (){
                                                                          setState((){
                                                                            decrement();
                                                                          });
                                                                        }),
                                                                  ),
                                                                  PrimaryButton(
                                                                      text: num.format(value).toString(),
                                                                      color: Colors.white70,
                                                                      onTap: (){

                                                                      },
                                                                      radius: 30,
                                                                      contentPadding: 16,
                                                                      textSize: 20,
                                                                      textColor: Colors.black,
                                                                      borderColor: Colors.black12),


                                                                  Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: Back(
                                                                        buttonColor: Colors.white,
                                                                        iconColor: primaryColor,
                                                                        icon: Icons.add,
                                                                        padding: 0,
                                                                        onTap: (){
                                                                          setState((){
                                                                            increment();
                                                                          });
                                                                        }),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),

                                                            const Spacer(),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: PrimaryButton(text: "Place a bid",
                                                                      color: primaryColor,
                                                                      textSize: 16,
                                                                      onTap: (){
                                                                        Get.back();
                                                                      },
                                                                      textColor: Colors.white,
                                                                      borderColor: primaryColor),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                        );

                                      },
                                      textColor: Colors.white,
                                      borderColor: primaryColor),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 10,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: listSeller.length,
                              itemBuilder: (BuildContext context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8),
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextView(
                                text: 'More collection',
                                size: SizeConfig.textMultiplier * 2.2,
                                fontWeight: FontWeight.w500,
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
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 50,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: listTrendingCollection.length,
                              itemBuilder: (BuildContext context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 10),
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
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                       const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PrimaryButton(
                                  text: '04:45:32',
                                  contentPadding: 14,
                                  color: Colors.white, onTap: (){

                              },
                                  textColor: Colors.black,
                                  borderColor: Colors.white),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20,right: 10),
                                  child: PrimaryButton(
                                    contentPadding: 14,
                                      radius: 8,
                                      textSize: 16,
                                      text: 'Place a Bid',
                                      color: primaryColor,
                                      onTap: (){
                                        Get.dialog(
                                            Scaffold(
                                              backgroundColor: Colors.transparent,
                                              body: Center(
                                                child: Container(
                                                  height: SizeConfig.heightMultiplier*70,
                                                  width: SizeConfig.widthMultiplier*80,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(12)
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
                                                    child: StatefulBuilder(
                                                      builder: (BuildContext context,StateSetter setState){
                                                        return Column(
                                                          children:  [
                                                            Padding(
                                                              padding: const EdgeInsets.symmetric(vertical: 10),
                                                              child: Row(
                                                                children: [
                                                                  Back(
                                                                    icon: CupertinoIcons.xmark,
                                                                    iconColor: Colors.black,
                                                                    size: 24,
                                                                    padding: 0,
                                                                    buttonColor: Colors.white,
                                                                    onTap: () {
                                                                      Get.back();
                                                                    },
                                                                  ),

                                                                  Padding(
                                                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                                                    child: TextView(
                                                                      text: widget.title.toString(),
                                                                      size: SizeConfig.textMultiplier*1.8,
                                                                      fontWeight: FontWeight.w600,
                                                                      color: Colors.black,

                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: SizeConfig.heightMultiplier*35,
                                                              width: SizeConfig.widthMultiplier*80,
                                                              child: Image.asset(widget.image.toString(),fit: BoxFit.fill,),

                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.symmetric(vertical: 12),
                                                              child: Row(
                                                                children: [
                                                                  TextView(
                                                                    text: 'Current Balance',
                                                                    size: SizeConfig.textMultiplier*1.6,
                                                                    color: Colors.black38,
                                                                  ),
                                                                  const Spacer(),
                                                                  RichText(text: TextSpan(
                                                                      children: [
                                                                        TextSpan(text: num.format(19220),
                                                                          style: TextStyle(
                                                                              fontSize: SizeConfig.textMultiplier*1.8,
                                                                              fontWeight: FontWeight.w600,
                                                                              color: Colors.black
                                                                          ),
                                                                        ),
                                                                        TextSpan(text: ' ETH',
                                                                          style: TextStyle(
                                                                              fontSize: SizeConfig.textMultiplier*1.4,
                                                                              fontWeight: FontWeight.w600,
                                                                              color: Colors.black
                                                                          ),
                                                                        )
                                                                      ]
                                                                  ))
                                                                ],
                                                              ),
                                                            ),
                                                            Row(
                                                              children: [
                                                                TextView(
                                                                  text: 'Highest bid',
                                                                  size: SizeConfig.textMultiplier*1.6,
                                                                  color: Colors.black38,
                                                                ),
                                                                const Spacer(),
                                                                RichText(text: TextSpan(
                                                                    children: [
                                                                      TextSpan(text: num.format(value),
                                                                        style: TextStyle(
                                                                            fontSize: SizeConfig.textMultiplier*1.8,
                                                                            fontWeight: FontWeight.w600,
                                                                            color: Colors.black
                                                                        ),
                                                                      ),
                                                                      TextSpan(text: ' ETH',
                                                                        style: TextStyle(
                                                                            fontSize: SizeConfig.textMultiplier*1.4,
                                                                            fontWeight: FontWeight.w600,
                                                                            color: Colors.black
                                                                        ),
                                                                      )
                                                                    ]
                                                                ))
                                                              ],
                                                            ),

                                                            Padding(
                                                              padding: const EdgeInsets.only(top: 10),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: Back(
                                                                        buttonColor: Colors.white,
                                                                        iconColor: Colors.black54,
                                                                        icon: Icons.horizontal_rule_outlined,
                                                                        size: 20,
                                                                        padding: 0,
                                                                        onTap: (){
                                                                          setState((){
                                                                            decrement();
                                                                          });
                                                                        }),
                                                                  ),
                                                                  PrimaryButton(
                                                                      text: num.format(value).toString(),
                                                                      color: Colors.white70,
                                                                      onTap: (){

                                                                      },
                                                                      radius: 30,
                                                                      contentPadding: 16,
                                                                      textSize: 20,
                                                                      textColor: Colors.black,
                                                                      borderColor: Colors.black12),


                                                                  Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: Back(
                                                                        buttonColor: Colors.white,
                                                                        iconColor: primaryColor,
                                                                        icon: Icons.add,
                                                                        padding: 0,
                                                                        onTap: (){
                                                                          setState((){
                                                                            increment();
                                                                          });
                                                                        }),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),

                                                            const Spacer(),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: PrimaryButton(text: "Place a bid",
                                                                      color: primaryColor,
                                                                      textSize: 16,
                                                                      onTap: (){
                                                                        Get.back();
                                                                      },
                                                                      textColor: Colors.white,
                                                                      borderColor: primaryColor),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                        );

                                      },
                                      textColor: Colors.white,
                                      borderColor: primaryColor),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                ],);
  }
}
