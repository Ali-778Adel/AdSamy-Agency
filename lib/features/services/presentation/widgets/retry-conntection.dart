import 'package:ad_samy/features/services/presentation/resources/services-dimens.dart';
import 'package:flutter/material.dart';

class RetryConnection extends StatelessWidget {
  final String errorMessage;
  final Function()onRefreshTap;
  const RetryConnection({Key? key,required this.errorMessage,required this.onRefreshTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(errorMessage,style:Theme.of(context).textTheme.bodyText1,),
          const SizedBox(width: 6,),
          InkWell(
            onTap:onRefreshTap ,
            child:Row(children: [
              Text('try again ',style:Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.red),),
              Icon(Icons.refresh_sharp,color:Colors.red,size: ServicesDimens.subtitle4,)
            ],),

          )


        ],
      ),
    );
  }
}
