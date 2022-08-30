import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft/models/category_model.dart';
import 'package:nft/utils/TextView.dart';
import 'package:nft/utils/auth_input_text_field.dart';
import 'package:nft/utils/buttons.dart';
import 'package:nft/utils/size_config.dart';
import 'package:nft/view/search/categories_screen.dart';
import '../../models/sellers_model.dart';
import '../../models/trending_collection_model.dart';
import '../../utils/colors.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: TextView(text: 'Search',size: SizeConfig.textMultiplier*2.5,fontWeight: FontWeight.w600,)),
                const SearchWidget(),
                categories(),
                TextView(text: "Sellers",size: SizeConfig.textMultiplier*2.2,fontWeight: FontWeight.w500,),
                buildSellers(),
                const SeeAllWidget(),
                moreCollections(),
              ],
            ),
          ),
        )
      ),
    );
  }

  Padding categories() {
    return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: listCategory.length,
                    shrinkWrap: true,
                    gridDelegate:  const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio:  1.1,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 20),
                    itemBuilder: (BuildContext context,index){
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                          onTap: (){
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: const Border(
                                top: BorderSide(color: Colors.black12),
                                left: BorderSide(color: Colors.black12),
                                bottom: BorderSide(color: Colors.black12),
                                right: BorderSide(color: Colors.black12
                                ),
                              ),
                              color: Colors.white,

                            ),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: SizeConfig.heightMultiplier*10,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(listCategory[index].image.toString()),fit: BoxFit.fill)
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextView(
                                            text: listCategory[index].title,
                                            size: SizeConfig.textMultiplier*1.6,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                       const Spacer(),
                                        TextView(
                                          text: listCategory[index].bid,
                                          size: SizeConfig.textMultiplier*1.5,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black38,
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                            ),
                          ),
                        ),
                      );
                    }),
              );
  }

  Padding moreCollections() {
    return Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 20),
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
                              // Get.to(const TrendingCollectionsScreen());
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
              );
  }

  Padding buildSellers() {
    return Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 20),
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
                          width: SizeConfig.widthMultiplier * 45,
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
                            padding: const EdgeInsets.symmetric(vertical: 8),
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
            );
  }
}

class SeeAllWidget extends StatelessWidget {
  const SeeAllWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextView(
            text: 'More Collection',
            size: SizeConfig.textMultiplier * 2,
            fontWeight: FontWeight.w500,
          ),
          TextButton(
              onPressed: () {
                // Get.to(const TrendingCollectionsScreen());
              },
              child: Row(
                children: [
                  TextView(
                    text: 'See all ',
                    color: primaryColor,
                    size: 16,
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

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              width: SizeConfig.widthMultiplier*70,
              child: const AuthTextInputField(
                hintText: 'Search',
                leftPadding: 20,
                topPadding: 15,
                bottomPadding: 15,
                prefixIcon: Icon(Icons.search_rounded,color: Colors.black,),
                bordercolor: Colors.white12,
                focusBorderColor:Colors.black12,
                radius: 10,
              ),
            ),
          ),
          Back(
              buttonColor: Colors.white,
              iconColor: Colors.black,
              icon: Icons.format_line_spacing_sharp,
              padding: 0,
              elevation: 0.5,
              onTap: (){
                Get.to(const CategoriesScreen());
              }),
        ],
      ),
    );
  }
}
