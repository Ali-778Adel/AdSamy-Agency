import 'package:ad_samy/core/resources/core-dimens.dart';
import 'package:ad_samy/core/resources/palette.dart';
import 'package:ad_samy/utils/ext/context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String?taskStartDate;
  final String? taskTitle;
  final String?projectTitle;
  const TaskItem({Key? key,this.taskStartDate,this.taskTitle,this.projectTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 8.0),
        child:
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text(projectTitle??'crm',style: Theme.of(context).textTheme.headline1,)),
                Expanded(
                  flex: 5,
                  child:Stack(
                    children: [ Container(
                    height: CoreDimens.h3,
                    // width: dou,
                    decoration:const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Palette.yellowPrimary,
                  ),

                  ),
                      Positioned(
                        left: 10,
                        right: 0,
                        bottom: 0,
                        top: 0,
                        child: Container(
                          height: CoreDimens.h2,
                          // width:200,
                          decoration:const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15)
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  // width: 200,
                                  child: ListTile(
                                    leading:const Icon(CupertinoIcons.time,color:Palette.darkBlue,size: 22,),
                                    title: Text(taskStartDate??'10:00 am',style: Theme.of(context).textTheme.bodyText1,) ,

                                  ),
                                ),
                              ),



                              Expanded(
                                child: SizedBox(
                                  // width:CoreDimens.space104,
                                  child: ListTile(
                                    leading:const Icon(Icons.task,color:Palette.darkBlue,size: 22,),
                                    title: Text(taskTitle??'taskTitle',style: Theme.of(context).textTheme.bodyText1,) ,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )

              ],
            ),

      )]
        )
      );
  }
}
