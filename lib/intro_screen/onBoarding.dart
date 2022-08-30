import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:nft/auth/view/registerScreen.dart';
import 'package:nft/utils/colors.dart';
import '../auth/view/loginScreen.dart';
import '../utils/buttons.dart';
class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}
class _OnBoardingState extends State<OnBoarding> {
  final _controller = PageController();
  int selectedIndex = 0;

  static const _kDuration = Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  final _kArrowColor = Colors.black.withOpacity(0.8);

  final List<Widget> _pages = <Widget>[
    ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:
                EdgeInsets.only(left: 20),
                child: Text(
                  "Discover the largest ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      wordSpacing: 1,
                      letterSpacing: 1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                child: Text(
                  "digital marketplace ",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8,horizontal: 20),
                child: Text(
                  "Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem semper parturient.",
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      wordSpacing: 1,
                      letterSpacing: 1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10,top: 20),
                      child: Image.asset(
                        "assets/images/onboarding1.png",
                        // height: 500,
                        // width: double.infinity,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 500,
                        // width: width,
                        decoration:  BoxDecoration(
                            gradient:LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0),
                                Colors.white.withOpacity(0.9),
                              ],
                              begin: const FractionalOffset(0.4, 0.2),
                              end: const FractionalOffset(0.4, 0.9),
                              stops: const [0.1, 1.0],
                            )
                        ),
                      ),
                    ),
                  ],
                ),

              ),
            ],
          ),
        ),
      ),
    ),
    ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Padding(
        padding: const EdgeInsets.only( top: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Best Seller ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                              fontSize: 25,
                              wordSpacing: 1,
                              letterSpacing: 1)),
                      const TextSpan(
                          text: 'can be \nfind easily',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25,
                              wordSpacing: 1,
                              letterSpacing: 1)),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8,horizontal: 20),
                child: Text(
                  "Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem semper parturient.",
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      wordSpacing: 1,
                      letterSpacing: 1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10,top: 20),
                      child: Image.asset(
                        "assets/images/onboarding2.png",
                        // height: 700,
                        // width: double.infinity,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 500,
                        // width: width,
                        decoration:  BoxDecoration(
                            gradient:LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0),
                                Colors.white.withOpacity(0.9),
                              ],
                              begin: const FractionalOffset(0.4, 0.2),
                              end: const FractionalOffset(0.4, 0.9),
                              stops: const [0.1, 1.0],
                            )
                        ),
                      ),
                    ),
                  ],
                ),

              ),
            ],
          ),
        ),
      ),
    ),
    ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Best ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                              fontSize: 28,
                              wordSpacing: 1,
                              letterSpacing: 1)),
                      const TextSpan(
                          text: 'Collection \nDigital Art',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25,
                              wordSpacing: 1,
                              letterSpacing: 1)),
                    ],
                  ),
                ),
              ),
               const Padding(
                 padding: EdgeInsets.symmetric(vertical: 8,horizontal: 20),
                 child: Text(
                  "Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem semper parturient.",
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      wordSpacing: 1,
                      letterSpacing: 1),
              ),
               ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10,top: 30),
                      child: Image.asset(
                        "assets/images/onboarding3.png",
                        // height: 500,
                        // width: double.infinity,
                        // width: double.infinity,
 ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 500,
                        // width: width,
                        decoration:  BoxDecoration(
                            gradient:LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0),
                                Colors.white.withOpacity(0.9),
                              ],
                              begin: const FractionalOffset(0.4, 0.2),
                              end: const FractionalOffset(0.4, 0.9),
                              stops: const [0.1, 1.0],
                            )
                        ),
                      ),
                    ),
                  ],
                ),

              ),
            ],
          ),
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            PageView.builder(
              itemCount: _pages.length,
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return _pages[index];
              },
            ),
            Positioned(
              top: height * 0.22,
              left: 1.0,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: DotsIndicator(
                    decorator: DotsDecorator(
                      activeColor: primaryColor,
                      color: Colors.black12,
                      size: const Size(10, 10),
                      activeSize: const Size(30, 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    dotsCount: _pages.length,
                    position: double.parse(selectedIndex.toString()),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 50,
                left: 0,
                right: 0,
                child: selectedIndex==_pages.length-1?
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: PrimaryButton(
                                  onTap: () {
                                    Get.offAll(const RegisterScreen());
                                  },
                                  text: 'Sign Up',
                                  color: primaryColor, textColor: Colors.white,
                                  borderColor: primaryColor,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: PrimaryButton(
                                    textColor: primaryColor,
                                    color: Colors.white,
                                    text: 'Sign In',
                                    onTap: (){
                                      Get.off(const LoginScreen());
                                    },
                                    borderColor: primaryColor,

                                  ),
                                ),
                              ],
                            )
                          ),
                        ],
                      ),
                    )
                    :Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Neumorphic(
                          style: NeumorphicStyle(
                              shape: NeumorphicShape.concave,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(40)),
                              depth: 4,
                              lightSource: LightSource.topLeft,
                              color: primaryColor),
                          child: Center(
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_forward,
                                size: 25,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState((){
                                  selectedIndex=selectedIndex+1;
                                  _controller.jumpToPage(selectedIndex);
                                });
                              },
                            ),
                          )),
                    ),

                  ],
                ))
          ],
        ),
      ),
    );
  }
}

