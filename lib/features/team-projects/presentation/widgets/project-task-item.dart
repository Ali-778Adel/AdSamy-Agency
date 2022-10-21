import 'package:ad_samy/core/resources/core-dimens.dart';
import 'package:ad_samy/core/resources/palette.dart';
import 'package:flutter/material.dart';

class ProjectTaskItem extends StatelessWidget {
  final String?taskTitle;
  final String?taskStartDate;
  const ProjectTaskItem({Key? key,this.taskTitle,this.taskStartDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
     height: CoreDimens.h80,
      decoration: BoxDecoration(
        color: Palette.white,
        borderRadius:const BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: Palette.lightBlack)
      ),
      child: Padding(padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          // 8401811596304947
          //*858*1*code#
          Expanded(
              flex: 1,
              child: Container(
            padding: const EdgeInsets.all(8.0),
            color: Palette.lightGreen,
              child: Center(child: Icon(Icons.description_outlined,size:CoreDimens.h5,color: Palette.darkBlue,))))
        ,Expanded(
            flex: 4,
          child: ListTile(
              title: Text(taskTitle??'Task Title',style: Theme.of(context).textTheme.headline1,),
              subtitle: Wrap(
                // crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  Icon(Icons.watch_later,size:CoreDimens.h5,color:Palette.darkBlue,),
                 const SizedBox(width: 10,),
                  Text(taskStartDate??'10:00 am',style: Theme.of(context).textTheme.bodyText1,)
                ],
              ),
            ),
        )

        ],
      ),
      ),
    );
  }
}
