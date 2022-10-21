import 'package:ad_samy/core/resources/core-dimens.dart';
import 'package:ad_samy/core/resources/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileFieldItem extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final IconData? trailingIcon;
  final Function()?onTap;
  const ProfileFieldItem({Key? key,required this.title,required  this.leadingIcon, this.trailingIcon,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const  EdgeInsets.symmetric(vertical: 14.0,horizontal: 8.0),
      child: InkWell(
        onTap:onTap ,
        child: Container(
          decoration:const BoxDecoration(
              color: Palette.lightGreen,
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          height: CoreDimens.h2,
          child: Center(
            child: ListTile(
              leading: Icon(leadingIcon,size:CoreDimens.h6,color: Palette.darkBlue,),
              title: Text(title,style:Theme.of(context).textTheme.bodyText1),
              trailing: Icon(CupertinoIcons.forward,size:CoreDimens.h8,color: Palette.darkBlue,),
            ),
          ),
        ),
      ),
    );
  }
}
