import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/functions/launcher.dart';
import '../../../../../core/resources/palette.dart';


class ContactUsItem extends StatelessWidget {
  final String imageAssets;
  final IconData?iconData;
  final String url;
  const ContactUsItem({Key? key,required this.imageAssets,required this.url,this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      child: Container(
        margin:  EdgeInsets.only(right: 48,bottom: 17),
        child: Container(
          margin:  EdgeInsets.only(bottom: 6),
          width: 50.w,
          height: 25.5.sp,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(10)
              ),
              boxShadow: [BoxShadow(
                  color: const Color(0x33808080),
                  offset: Offset(0,0),
                  blurRadius: 2,
                  spreadRadius: 1
              )] ,
              color: Palette.white
          ),
          child:  Center(
            child: Container(
              width: 20.sp,
              height: 20.sp,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('$imageAssets'),
                      fit: BoxFit.fill,
                  ),
                  // color: const Color(0xffd9d9d9),
                  borderRadius: BorderRadius.all(Radius.circular(4.sp))
              ),
              // child: Image.asset('assets/splash_screen/profile2.png',fit: BoxFit.fill,),
            ),
          ),
        ),
      ),
      onTap: (){
        launchUrl1(url);
      },
    );
  }


}
