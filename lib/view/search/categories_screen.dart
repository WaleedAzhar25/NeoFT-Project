import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft/utils/TextView.dart';
import 'package:nft/utils/buttons.dart';
import 'package:nft/utils/size_config.dart';
import '../../models/category_model.dart';
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}
class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const BackTitleWidget(),
            Padding(
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
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BackTitleWidget extends StatelessWidget {
  const BackTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Back(
          elevation: 0,
            buttonColor: Colors.white,
            iconColor: Colors.black,
            onTap: (){
            Get.back();
            },
        ),
         TextView(
           text: 'Categories',
           size: SizeConfig.textMultiplier*2.5,
         fontWeight: FontWeight.w600,
         ),
        const SizedBox(width: 40,),
      ],
    );
  }
}
