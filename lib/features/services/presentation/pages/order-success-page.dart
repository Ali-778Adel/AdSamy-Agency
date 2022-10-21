import 'package:ad_samy/features/services/presentation/pages/services_page.dart';
import 'package:ad_samy/features/services/presentation/show_services_bloc/bloc.dart';
import 'package:ad_samy/features/services/presentation/show_services_bloc/bloc_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/core-dimens.dart';
import '../../../../core/resources/palette.dart';

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: PreferredSize(
      preferredSize: Size(double.infinity,CoreDimens.h3),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: AppBar(
          elevation: 0.0,
          backgroundColor: Palette.white,
          leading: IconButton(icon: CircleAvatar(
            radius: 25,
            backgroundColor: Palette.darkBlue,
            child: Center (child: Icon(CupertinoIcons.back,color: Palette.white,size: CoreDimens.h8,)),
          ),onPressed: (){
            BlocProvider.of<ShowAllServicesBloc>(context).add(ShowAllServicesEvent(index: 0));
          },),
        ),
      ),
    ),
  body:Container(
  color: Colors.white,
  child: Column(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
  Expanded(
  child:  SizedBox(
  height: CoreDimens.cardH5,
  width: double.infinity,
  child: Image.asset('assets/success.png',fit: BoxFit.fill,),
  ),
  ),
  Expanded(child: Container(
  padding: const EdgeInsets.all(24.0),
  child: Text('\n\nyour request sent successfully to our support team ,we will contact you as soon as possible. ',style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),)))
  ],
  ),),
  );
  }}

