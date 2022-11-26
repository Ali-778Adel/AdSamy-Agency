import 'package:ad_samy/applications/lead-application/services/presentation/widgets/rating-bar.dart';
import 'package:ad_samy/core/functions/launcher.dart';
import 'package:ad_samy/core/resources/core-dimens.dart';
import 'package:ad_samy/core/resources/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/core-features/authentiacation/presentation/widgets/spacer-v.dart';

class OurWorksItem extends StatelessWidget {
  final String imageUrl;
  final String siteUrl;
  final String description;
  final String workName;

  const OurWorksItem({
    Key? key,
    required this.imageUrl,
    required this.siteUrl,
    required this.workName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(right: 15,bottom: 4),
      // width: CoreDimens.space184,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(10)
          ),
          boxShadow: [BoxShadow(
              color: const Color(0x17000000),
              offset: Offset(0,4),
              blurRadius: 1,
              spreadRadius: 1
          )] ,
          color: const Color(0xffffffff)
      ),
      child: InkWell(
        child: Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,top: 19),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      image:DecorationImage(
                        fit: BoxFit.fill,
                        image:AssetImage(imageUrl,),
                      ),
                    borderRadius: BorderRadius.all(Radius.circular(CoreDimens.subtitle4))
                  ),
                  width: 160.w,
                  height: 106.sp,
                ),
              ),
              SpacerV(),
               Expanded(
                   flex: 1,
                   child: Text(workName,style: Theme.of(context).textTheme.bodyText1,)),
              SpacerV(),
               Expanded(child: Text(description,style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Palette.lightBlack),)),
              SpacerV(),
               Expanded(
                   flex: 1,
                   child: RatingBarWidget(itemSize:14.sp,))





            ],
          ),

        ),
        onTap: (){
          launchUrl1(siteUrl);
        },
      ),


    );
  }
}
