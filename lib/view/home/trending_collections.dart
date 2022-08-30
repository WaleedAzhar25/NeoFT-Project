import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft/models/trending_collection_model.dart';
import 'package:nft/view/home/detail_trending_screen.dart';
import '../../utils/TextView.dart';
import '../../utils/buttons.dart';
import '../../utils/colors.dart';
import '../../utils/size_config.dart';
class TrendingCollectionsScreen extends StatefulWidget {
  const TrendingCollectionsScreen({Key? key}) : super(key: key);

  @override
  State<TrendingCollectionsScreen> createState() => _TrendingCollectionsScreenState();
}

class _TrendingCollectionsScreenState extends State<TrendingCollectionsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics:const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
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
                      text: "Trending Collections",
                      size: SizeConfig.textMultiplier*2.2,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(width: 20,),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: listTrendingCollection.length,
                      shrinkWrap: true,
                      gridDelegate:  const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio:  0.5,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 20),
                      itemBuilder: (BuildContext context,index){
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                          onTap: (){
                            Get.to(DetailTrendingScreen(image: listTrendingCollection[index].image, title: listTrendingCollection[index].title, tag: listTrendingCollection[index].tag,favourite: listTrendingCollection[index].check, likes: listTrendingCollection[index].favourite,));
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
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: SizeConfig.heightMultiplier*20,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(listTrendingCollection[index].image.toString()),fit: BoxFit.fill)
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextView(
                                        text: listTrendingCollection[index].title,
                                        size: SizeConfig.textMultiplier*1.8,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                                      child: TextView(
                                        text: listTrendingCollection[index].tag,
                                        size: SizeConfig.textMultiplier*1.7,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black38,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8,top: 10),
                                      child: TextView(
                                        text: listTrendingCollection[index].etherium,
                                        size: SizeConfig.textMultiplier*1.8,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      child: Row(
                                        children: [
                                          TextView(
                                            text: 'Highest bid',
                                            size: SizeConfig.textMultiplier*1.4,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black38,
                                          ),
                                          const Spacer(),
                                          IconButton(
                                              padding: const EdgeInsets.only(left: 20),
                                              onPressed: (){
                                            setState((){
                                              listTrendingCollection[index].check=!listTrendingCollection[index].check;
                                            });
                                          }, icon:listTrendingCollection[index].check==false? const Icon(Icons.favorite_border_outlined,
                                            size: 24,
                                          ): Icon(Icons.favorite_sharp,
                                            size: 24,
                                            color: primaryColor,
                                          )
                                          ),
                                          TextView(
                                            text: listTrendingCollection[index].favourite.toString(),
                                            color: Colors.black38,
                                            fontWeight: FontWeight.w500,
                                          )
                                        ],
                                      ),
                                    ),


                                  ],
                                )
                            ),
                          ),
                        ),
                      );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
