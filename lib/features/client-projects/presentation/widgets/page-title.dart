import 'package:ad_samy/core/resources/palette.dart';
import 'package:ad_samy/features/authentiacation/presentation/widgets/spacer-v.dart';
import 'package:ad_samy/features/services/presentation/resources/services-dimens.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/core-dimens.dart';

class ClientsPageTitle extends StatelessWidget {
  final String title;
  final  TabController? tabController;
  final  Function(int?)? function;
  const  ClientsPageTitle({Key? key, required this.title, this.function,this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: CoreDimens.cardH2,
      padding: const EdgeInsets.only(
        top: 15,
        bottom: 10
      ),
      color: Colors.white,
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: ServicesDimens.subtitle1,
                  color: Palette.darkBlue,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SpacerV(),
           TabBar(
             indicatorPadding: const EdgeInsets.only(top:1),
          isScrollable: true,
          physics: const BouncingScrollPhysics(),
          indicatorColor: Palette.darkBlue,
          controller: tabController,
          labelPadding: const EdgeInsets.only(left: 6,right: 6),
          indicatorSize: TabBarIndicatorSize.values[1],
          onTap: function,
          tabs:  [
           _buildItem(context, Icons.description_outlined, 'overview'),
           _buildItem(context, Icons.details, 'Details'),
           _buildItem(context, Icons.task, 'Tasks'),
           _buildItem(context, Icons.payments, 'payments'),

          ])
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context,IconData itemIcon, String itemText ){
    return ClayContainer(
      surfaceColor: Colors.white,
      borderRadius: 10,
      spread: .9,
      depth: 4,
      width: 118,
      height: 100,
      child: Tab(
        icon: Icon(itemIcon,size: 32,color: Palette.darkBlue,),
        child: Text(itemText,style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18,color: Palette.lightBlack,fontWeight: FontWeight.normal),),
      ),
    );
  }

}
