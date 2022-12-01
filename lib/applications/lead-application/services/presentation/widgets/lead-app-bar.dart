import 'package:ad_samy/core/resources/core-dimens.dart';
import 'package:ad_samy/core/resources/palette.dart';
import 'package:flutter/material.dart';

class LeadAppBar{
<<<<<<< HEAD
  PreferredSizeWidget call({required BuildContext context, Function()?back}){
=======
  PreferredSizeWidget call({required BuildContext context,required Function()back}){
>>>>>>> 230a0cab7852a1b5ee14ebb56c6bad628c9998c7
   return AppBar(
     elevation: 0.0,
toolbarHeight: CoreDimens.h1,
     backgroundColor: Colors.transparent,
     leading: Padding(
       padding: const EdgeInsets.only(left:24,top: 24),
       child:CircleAvatar(
         backgroundColor: Palette.darkBlue,
         radius: CoreDimens.h8,
         child: Center(
           child: IconButton(
<<<<<<< HEAD
             onPressed:(){
               Navigator.pop(context);
             },
=======
             onPressed:back,
>>>>>>> 230a0cab7852a1b5ee14ebb56c6bad628c9998c7
             icon:  Padding(
               padding: const EdgeInsets.only( left: 3.0),
               child: Icon(Icons.arrow_back_ios,size: CoreDimens.h8,color: Palette.white,),
             ),
           ),
         ),
       ) ,
     ),
     actions: [
       Padding(
         padding: const EdgeInsets.only(
             top: 16,
             right:16),
         child:CircleAvatar(
           backgroundColor: Colors.transparent,
           radius: CoreDimens.h6,
           child: Image.asset('assets/splash_screen/logo.png',fit: BoxFit.fill,)
         ) ,
       ),
     ],
   );
  }

}