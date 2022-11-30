// ignore_for_file: file_names

import 'package:ad_samy/applications/lead-application/services/presentation/widgets/rating-bar.dart';
import 'package:ad_samy/core/resources/palette.dart';
import 'package:flutter/material.dart';
import '../../../../../core/core-features/authentiacation/presentation/widgets/auth-customButton.dart';
import '../../../../../core/core-features/authentiacation/presentation/widgets/spacer-v.dart';
import '../lead-blocs/lead-service-details-bloc/service-details-states.dart';
import '../resources/services-dimens.dart';

class ServiceDetailsWidget extends StatelessWidget {

  final Function()onTap;
  final ShowServiceDetailsStates1?state;
  const ServiceDetailsWidget({Key? key,required this.onTap, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(ServicesDimens.space10),
        child: Column(
          key: const Key('serviceDetailsColumn'),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              widthFactor: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              child: Text(
                '${state!.serviceDetailsEntity!.serviceMainDataEntity!.serviceDetailsEntityData!.categoryName}',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            _serviceImage(
                context,
              serviceImage:'${state!.serviceDetailsEntity!.serviceMainDataEntity!.imageUrl}/${state!.serviceDetailsEntity!.serviceMainDataEntity!.serviceDetailsEntityData!.subImage2}'
            ),
            Align(
              widthFactor: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              child: Text(
              state!.serviceDetailsEntity!.serviceMainDataEntity!.serviceDetailsEntityData!.categoryDescription,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            SpacerV(
              value: ServicesDimens.space16,
            ),
            const RatingBarWidget(),
            _horizontalScrollBar(context:context,states: state),
            SpacerV(
              value: ServicesDimens.space24,
            ),
            Center(
                child: AuthCustomButton(
                        buttonText: 'Enroll Now',
                        onTap: onTap,
                      )



                )
          ],
        ),
      ),
    );
  }

  Widget _serviceImage(BuildContext context, {
    String?serviceImage
  }) {
    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      width: MediaQuery.of(context).size.width,
      height: ServicesDimens.cardH1,
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: GridTile(
          footer: Container(
            padding: const EdgeInsets.all(8),
            color: Palette.yellowAccent,
            child:  Text(
              '${state!.serviceDetailsEntity!.serviceMainDataEntity!.serviceDetailsEntityData!.serviceDiscount??'10%'} Discount ',
              textAlign: TextAlign.center,
              style:const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          child: Image.network(
            serviceImage!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }



  Widget _horizontalScrollBar({BuildContext? context,ShowServiceDetailsStates1?states}) {
    return SizedBox(
        height: ServicesDimens.cardH3,
        width: MediaQuery.of(context!).size.width,
        child: ListView(
          // itemExtent: MediaQuery.of(context).size.width * .50,
          padding: const EdgeInsets.all(10),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(left: 5,right:5),
              child: Image.network('${states!.serviceDetailsEntity!.serviceMainDataEntity!.imageUrl}/${states.serviceDetailsEntity!.serviceMainDataEntity!.serviceDetailsEntityData!.mainImage}'),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(left: 5,right:5),
              child: Image.network('${states.serviceDetailsEntity!.serviceMainDataEntity!.imageUrl}/${states.serviceDetailsEntity!.serviceMainDataEntity!.serviceDetailsEntityData!.subImage1}'),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(left: 5,right:5),
              child: Image.network('${states.serviceDetailsEntity!.serviceMainDataEntity!.imageUrl}/${states.serviceDetailsEntity!.serviceMainDataEntity!.serviceDetailsEntityData!.subImage2}'),
            )
          ],
        ));
  }
}
