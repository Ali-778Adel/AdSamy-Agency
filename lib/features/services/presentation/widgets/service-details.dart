import 'package:ad_samy/core/resources/palette.dart';
import 'package:ad_samy/features/authentiacation/presentation/widgets/spacer-v.dart';
import 'package:ad_samy/features/services/presentation/resources/services-dimens.dart';
import 'package:ad_samy/features/services/presentation/widgets/rating-bar.dart';
import 'package:flutter/material.dart';
import '../../../authentiacation/presentation/widgets/auth-customButton.dart';

class ServiceDetailsWidget extends StatelessWidget {

  final Function()onTap;
  const ServiceDetailsWidget({Key? key,required this.onTap}) : super(key: key);

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
                ' Social Media Management ',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            _serviceImage(context),
            Align(
              widthFactor: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              child: Text(
                ' Lorem ipsum dolor sit amet, consetetur sadipscing elitr,'
                ' sed diam nonumy eirmod tempor invidunt ut labore et'
                ' dolore magna aliquyam erat, sed diam voluptua.'
                ' At vero eos et accusam et justo duo dolores et ea rebum ',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            SpacerV(
              value: ServicesDimens.space16,
            ),
            const RatingBarWidget(),
            _horizontalScrollBar(context),
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

  Widget _serviceImage(BuildContext context, {int? index}) {
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
            child: const Text(
              '50% Discount ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          child: Image.network(
            'https://resources.pulse.icc-cricket.com/ICC/photo/2018/04/22/c19486c2-4e5b-48c4-82af-c6d0eebb7bd2/Main.jpg',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  List<Widget> _listsWidget(BuildContext context) {
    return List.generate(
        10,
        (index) => Container(
            margin: const EdgeInsets.only(right: 10),
            child: _serviceImage(context, index: index)));
  }

  Widget _horizontalScrollBar(BuildContext context) {
    return SizedBox(
        height: ServicesDimens.cardH3,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          itemExtent: MediaQuery.of(context).size.width * .45,
          padding: const EdgeInsets.all(10),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: _listsWidget(context),
        ));
  }
}
