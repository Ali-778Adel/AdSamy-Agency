
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../resources/core-dimens.dart';
import '../../resources/palette.dart';
import '../../widgets/intro-background-container.dart';
import 'main-login-option.dart';

class OnBoardingModel {
  String? image;
  String? titleText;
  String? text;
  OnBoardingModel({this.image, this.titleText, this.text});
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return OnBoardingState();
  }
}

class OnBoardingState extends State<OnBoardingScreen> {
  var pageController = PageController();
  bool islastScreen = false;

  List<OnBoardingModel> onboardingScreens = [
    OnBoardingModel(
      image: 'assets/onboarding/on_boarding_image1.png',
      titleText: 'Our Services',
      text: 'AdSamy is a marketing Agency,which provide a business development service ,'
          'like ,app&web development ,social media management ,content creation ...etc ',
    ),
    OnBoardingModel(
      image: 'assets/onboarding/on_boarding_image2.png',
      titleText: 'Our Clients',
      text: 'Adsamy client are almost business men or ordinary people ,that aim to success and develop their business in right way',
    ),
    OnBoardingModel(
        image: 'assets/onboarding/on_boarding_image3.png',
        titleText: 'Our Employees',
        text: "Adsamy's Employees are creationl people ,they work together to add optimistic value to their agency as they consider that ,AdSamy business is their business."),
  ];
  void onSubmit() {
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => const MainLoginOption()),
        (route) {
      return false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroBackGroundContainer(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
          child: Container(
            margin: const EdgeInsets.only(top: 60),
            height: MediaQuery.of(context).size.height * 0.90,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: pageController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return itemBuilder(context, onboardingScreens[index]);
                    },
                    onPageChanged: (index) {
                      if (index == onboardingScreens.length - 1) {
                        setState(() {
                          islastScreen = true;
                        });
                      } else {
                        setState(() {
                          print(index);
                          islastScreen = false;
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          onSubmit();
                        },
                        child: Text(
                          'skip',
                          style: (Theme.of(context).textTheme.bodyText1)!
                              .copyWith(
                                  color: Palette.white,
                                  fontWeight: FontWeight.bold),
                        )),
                    SmoothPageIndicator(
                      controller: pageController,
                      count: onboardingScreens.length,
                      effect: const ExpandingDotsEffect(
                          spacing: 8.0,
                          radius: 4.0,
                          dotWidth: 10.0,
                          dotHeight: 8.0,
                          paintStyle: PaintingStyle.fill,
                          strokeWidth: 1.5,
                          dotColor: Palette.white,
                          activeDotColor: Palette.darkBlue),
                      onDotClicked: (index) {
                        setState(() {
                          pageController.animateToPage(index,
                              duration: const Duration(milliseconds: 1050),
                              curve: Curves.easeOutBack);
                        });
                      },
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Palette.darkBlue,
                          child: IconButton(
                              splashColor: Palette.white,
                              onPressed: () {
                                if (islastScreen) {
                                  setState(() {
                                    onSubmit();
                                  });
                                } else {
                                  setState(() {
                                    pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 1050),
                                        curve: Curves.easeOutBack);
                                  });
                                }
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: Palette.white,
                                size: CoreDimens.h8,
                              )),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget itemBuilder(BuildContext context, OnBoardingModel model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Image.asset(
        model.image!,
        fit: BoxFit.contain,
        height: 300,
        width: MediaQuery.of(context).size.width * 0.99,
      ),
      const SizedBox(
        height: 30,
      ),
      Center(
        child: Text(
          model.titleText!,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(

          textAlign:TextAlign.start
          ,model.text!,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(height: 2.2),
        ),
      )
    ],
  );
}
