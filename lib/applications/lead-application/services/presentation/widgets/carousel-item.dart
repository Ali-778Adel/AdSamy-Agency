import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/core-dimens.dart';
import '../../../../../core/resources/palette.dart';


class CarouselItem extends StatelessWidget {
  final String imageUrl;
  const CarouselItem({Key? key,required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
<<<<<<< HEAD
            child:imageUrl.isNotEmpty? Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ):Image.asset('assets/splash_screen/logo.png')

        ),
        Positioned(
            top:0.sp,
=======
            child: Image.network(
              imageUrl,
              fit: BoxFit.contain,
            )),
        Positioned(
            top:100.sp,
>>>>>>> 230a0cab7852a1b5ee14ebb56c6bad628c9998c7
            left: 5,
            right: 5,
            child: Container(
              color: Palette.black.withOpacity(.45),
              height: CoreDimens.h3,
              width: MediaQuery.of(context).size.width,
              child: Center(
                  child: Text(
<<<<<<< HEAD
                    imageUrl.isEmpty?'Get Best Offers':'20% Discount',style: Theme.of(context).textTheme.headline1!.copyWith(color:Palette.white),)),
=======
                    '20% Discount',style: Theme.of(context).textTheme.headline1!.copyWith(color:Palette.white),)),
>>>>>>> 230a0cab7852a1b5ee14ebb56c6bad628c9998c7
            )),

      ],
    );
  }
}
