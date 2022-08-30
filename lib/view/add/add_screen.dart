import 'dart:developer';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:nft/utils/TextView.dart';
import 'package:nft/utils/buttons.dart';
import 'package:nft/utils/size_config.dart';
import '../../utils/auth_input_text_field.dart';
import '../../utils/colors.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final num =  NumberFormat("#,##0", "en_US");

  int value=12220;
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      log('Failed to pick image: $e');
    }
  }

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
                    text: "Upload",
                    size: SizeConfig.textMultiplier * 3,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  height: SizeConfig.heightMultiplier * 30,
                  width: SizeConfig.widthMultiplier * 100,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      image: image == null
                          ? null
                          : DecorationImage(
                              image: FileImage(image!), fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(20)),
                  child: image == null
                      ? GestureDetector(
                          onTap: () {
                            pickImage();
                          },
                          child: const Center(child: AddImage()))
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Back(
                              buttonColor: Colors.white.withOpacity(0.1),
                              iconColor: Colors.white,
                              padding: 0,
                              onTap: () {
                                pickImage();
                              },
                              icon: Icons.edit,
                            ),
                          ],
                        ),
                ),
              ),
              const Padding(
                padding:  EdgeInsets.only(top: 16),
                child:  Text(
                  " Item's Name",
                  style:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: ItemName(itemNameController: itemNameController)),
              const Padding(
                padding:  EdgeInsets.only(top: 12),
                child:  Text(
                  "Description",
                  style:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: ItemDescription(descriptionController: descriptionController)),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                          text: "Save Changes",
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
                                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
                                        child: StatefulBuilder(
                                          builder: (BuildContext context,StateSetter setState){
                                            return Column(
                                              children:  [
                                                SizedBox(
                                                  height: SizeConfig.heightMultiplier*20,
                                                  width: SizeConfig.widthMultiplier*50,
                                                  child: Image.asset('assets/images/upload.png',),
                                                ),
                                                 Padding(
                                                   padding: const EdgeInsets.symmetric(vertical: 12),
                                                   child: TextView(
                                                      text: "Upload Successfully",
                                                size: SizeConfig.textMultiplier*2.6,
                                                     fontWeight: FontWeight.w600,
                                                ),
                                                 ),
                                                TextView(
                                                  text: "Lorem ipsum dolor sit amet,consectetur ",
                                                  size: SizeConfig.textMultiplier*1.5,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black38,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    TextView(
                                                      text: "eiltootm adipiscing elit. ",
                                                      size: SizeConfig.textMultiplier*1.5,
                                                      fontWeight: FontWeight.w400,
                                                      color: Colors.black38,
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top:15,bottom: 12),
                                                  child: TextView(
                                                    text: "Your Link",
                                                    size: SizeConfig.textMultiplier*2,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                TextView(
                                                  text: "dfhiehiejrkjforoipwwwkdjf",
                                                  size: SizeConfig.textMultiplier*1.5,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black38,
                                                ),
                                               Padding(
                                                 padding: const EdgeInsets.symmetric(vertical: 15),
                                                 child: Row(
                                                   mainAxisAlignment: MainAxisAlignment.center,
                                                   children: const[
                                                     CopyLink(),
                                                   ],
                                                 ),
                                               ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                                                        child: PrimaryButton(
                                                            text: "Upload Another",
                                                            color: primaryColor,
                                                            onTap: (){
                                                              Get.back();
                                                            },
                                                            textColor: Colors.white,
                                                            borderColor: primaryColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
                                                        child: PrimaryButton(
                                                            text: "Next time",
                                                            color: Colors.white,
                                                            onTap: (){
                                                              Get.back();
                                                            },
                                                            textColor: primaryColor,
                                                            borderColor: primaryColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
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
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

class CopyLink extends StatelessWidget {
  const CopyLink({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white54,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          )
        ),
        onPressed: (){

    },
        child: Row(
          children: const [
            Icon(Icons.copy,color: Color(0xff00C566),),
            Text(" Copy Link",style: TextStyle(color: Color(0xff00C566),),)
          ],
        ));
  }
}

class ItemDescription extends StatelessWidget {
  const ItemDescription({
    Key? key,
    required this.descriptionController,
  }) : super(key: key);

  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return AuthTextInputField(
      textInputType: TextInputType.text,
      textInputAction: TextInputAction.done,
      bordercolor: Colors.black12,
      maxLines: 6,
      hintSize: 14,
      hintcolor: Colors.black54,
      cursorColor: Colors.black12,
      focusBorderColor: Colors.black12,
      textEditingController: descriptionController,
      validator: (value) {
        if (value!.isEmpty) {
          Get.snackbar("Description", "Enter your description");
        }
        return null;
      },
      hintText: 'Description',
    );
  }
}

class ItemName extends StatelessWidget {
  const ItemName({
    Key? key,
    required this.itemNameController,
  }) : super(key: key);

  final TextEditingController itemNameController;

  @override
  Widget build(BuildContext context) {
    return AuthTextInputField(
      textInputType: TextInputType.text,
      textInputAction: TextInputAction.next,
      bordercolor: Colors.black12,
      hintSize: 14,
      hintcolor: Colors.black54,
      cursorColor: Colors.black12,
      focusBorderColor: Colors.black12,
      textEditingController: itemNameController,
      validator: (value) {
        if (value!.isEmpty) {
          Get.snackbar("Item's Name", "Enter your Item Name");
        }
        return null;
      },
      hintText: 'Item Name',
    );
  }
}

class AddImage extends StatelessWidget {
  const AddImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      strokeWidth: 1.5,
      radius: const Radius.circular(5),
      dashPattern: const [7, 6],
      color: const Color(0xff00C566),
      // padding: EdgeInsets.all(6),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        child: SizedBox(
          height: SizeConfig.heightMultiplier * 4,
          width: SizeConfig.widthMultiplier * 30,
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.add,
                color: Color(0xff00C566),
                size: 18,
              ),
              TextView(
                text: 'Add Image',
                color: Color(0xff00C566),
              )
            ],
          )),
        ),
      ),
    );
  }
}
