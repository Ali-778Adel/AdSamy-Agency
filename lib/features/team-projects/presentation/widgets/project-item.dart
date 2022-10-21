import 'package:ad_samy/core/resources/core-dimens.dart';
import 'package:ad_samy/core/resources/palette.dart';
import 'package:ad_samy/features/team-projects/presentation/bloc/team-states.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../authentiacation/presentation/widgets/spacer-v.dart';

class ProjectItem extends StatelessWidget {
  final String?projectName;
  final int ?taskCount;
  final double?taskProgress;

  const ProjectItem({Key? key,this.projectName,this.taskCount,this.taskProgress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Palette.lightBlack,),
          borderRadius:const BorderRadius.all(Radius.circular(26))
        ),
        width: MediaQuery.of(context).size.width*.65,
        key: const Key('ProjectItemContainer'),
        child: ClayContainer(
          // emboss: true,
          depth: 25,
          spread: 2,
          color: Palette.white,
          borderRadius: 25,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 35,vertical: 35),
                height: 130.sp,
                width: 160.sp,
                decoration:const BoxDecoration(
                    color: Palette.yellowPrimary,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Text(projectName??'ProjectName',style:Theme.of(context).textTheme.headline1),
                    const SpacerV(),
                    Text('${taskCount??23 }',style:Theme.of(context).textTheme.bodyText1),
                  ],
                ),

              ),
              _itemIndicator(taskProgress??.2)
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemIndicator(double progressValue){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircularPercentIndicator(
        radius: CoreDimens.h3,
        lineWidth: 7.0,
        arcType: ArcType.FULL,
        arcBackgroundColor: Palette.darkBlue,
        animation: true,
        progressColor: Palette.yellowPrimary,
        circularStrokeCap: CircularStrokeCap.round,
        animationDuration: 1000,
        percent: progressValue,
        center: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
              text: ' ${progressValue * 100}%\n',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: CoreDimens.subtitle2),
            ),
          ]),
        ),
      ),
    );
  }
}
