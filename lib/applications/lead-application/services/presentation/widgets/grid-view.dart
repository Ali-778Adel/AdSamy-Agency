import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/core-features/authentiacation/presentation/widgets/spacer-v.dart';
import '../../../../../core/resources/palette.dart';
import '../../domain/entities/service_entity.dart';
import '../lead-blocs/lead-home-page-bloc/bloc.dart';
import '../lead-blocs/lead-home-page-bloc/bloc_events.dart';
import '../lead-blocs/lead-home-page-bloc/bloc_states.dart';
import '../resources/services-dimens.dart';


class ServicesWidget extends StatelessWidget {
  final ServiceEntity services;
  final Function()onTap;
  final ShowAllServicesStates?showAllServicesStates;
  const ServicesWidget({Key? key, required this.services,required this.onTap,this.showAllServicesStates}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GridView.builder(
        key: const Key('grid'),
        physics:const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            mainAxisExtent: 200,
          ),
          scrollDirection: Axis.vertical,
        itemCount: showAllServicesStates!.serviceEntity!.data!.categories!.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return _itemBuilder(index: index,context:context,state:showAllServicesStates  );
          }),
    );
  }

  Widget _itemBuilder({required int index,required BuildContext context ,ShowAllServicesStates ?state}) {
    return Container(
      key:  ValueKey(index),
      margin: const EdgeInsets.all(10),
      color: Colors.white.withOpacity(.01),
      child:  InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Image.network(
                  '${services.data!.imageBaseUrl}/${services.data!.categories![index].catImage}',
                  fit: BoxFit.cover,
                )),
            SpacerV(
              value: ServicesDimens.space24,
            ),
            Expanded(
                flex: 1,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Text(
                      services.data!.categories![index].catName??'null',
                      style: TextStyle(
                          color: Palette.darkBlue,
                          fontSize: ServicesDimens.subtitle3,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

