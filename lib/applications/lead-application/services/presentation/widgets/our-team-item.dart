import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/palette.dart';


class OurTeamItem extends StatelessWidget {
  final String?EName;
  final String?EAvatar;
  final String?EPosition;
  const OurTeamItem({Key? key,this.EAvatar,this.EName,this.EPosition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 120.sp,
      margin:  EdgeInsets.only(right: 24,bottom: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin:  EdgeInsets.only(bottom: 6),
            width: 60.w,
              height: 55.sp,
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
                  width: 32.sp,
                  height: 32.sp,

                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('${EAvatar}'),
                      fit: BoxFit.fill

                    ),
                      color: const Color(0xffd9d9d9),
                    borderRadius: BorderRadius.all(Radius.circular(16.sp))
                  ),
                // child: Image.asset('assets/splash_screen/profile2.png',fit: BoxFit.fill,),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8.sp),
            child: Text(
              '${EName}',
              style: Theme.of(context).textTheme.bodyText1!
                  .copyWith(color: Palette.white,fontWeight: FontWeight.w500,fontSize: 12),),
          ),
          Container(
            child: Text(
              '${EPosition}',
              style: Theme.of(context).textTheme.bodyText1!
                  .copyWith(color: Palette.black10,fontWeight: FontWeight.w500,fontSize: 12),),
          )
        ],
      ),
    );
  }
}
