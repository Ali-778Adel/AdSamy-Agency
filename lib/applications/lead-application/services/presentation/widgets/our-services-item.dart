import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/core-features/authentiacation/presentation/widgets/spacer-v.dart';
import '../../../../../core/resources/palette.dart';


class OurServicesItem extends StatelessWidget {
  final String ?serviceTitle;
  final String?imgPath;
  const OurServicesItem({Key? key,this.imgPath, this.serviceTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical:4,horizontal: 22),
          height: 66.sp,
          width:82.w,
          padding: const EdgeInsets.symmetric(horizontal: 27,vertical: 18),
          decoration: BoxDecoration(
              color: Palette.white,
              borderRadius:BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 1,
                    blurStyle: BlurStyle.outer,
                    offset: Offset(0.0,2.0),
                    color: Colors.white10
                )
              ]
          ),
          child: Image.asset(imgPath??'assets/services/ads.png',height: 24.sp,width: 24.w,color: Palette.darkBlue,fit: BoxFit.cover,),),
        SpacerV(),
        Container(
          width:82.sp ,
            child:serviceTitle==null?_shimmerText(): Text(serviceTitle!,style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Palette.lightBlack,fontSize: 11.sp,fontWeight: FontWeight.normal),maxLines: 2)),

      ],
    );
  }

Widget _shimmerText(){
    return Container(
      height: 16.sp,
      width:41.w ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.sp))
      ),
    );
}
}
