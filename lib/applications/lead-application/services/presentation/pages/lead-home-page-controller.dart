
import 'package:ad_samy/applications/lead-application/services/presentation/pages/service-details-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../show_services_bloc/bloc.dart';
import '../show_services_bloc/bloc_events.dart';
import '../show_services_bloc/bloc_states.dart';
import '../widgets/lead-app-bar.dart';
import 'lead-home-page.dart';
import 'leading-info-page.dart';
import 'order-success-page.dart';

class LeadHomePageController extends StatelessWidget {
  final List<Widget> _fragments = [
     LeadHomePage(),
    const ServiceDetailsPage(),
    LeadingInfoPage(),
    const OrderSuccess(),
  ];
  LeadHomePageController({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowAllServicesBloc, ServicesStates>(
        builder: (context, state) {
      int currentIndex =
          BlocProvider.of<ShowAllServicesBloc>(context).currentIndex;
      return WillPopScope(
        onWillPop: () {
          return _onPop(context, currentIndex);
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: LeadAppBar().call(
              context: context,
              back: () {
                return _onPop(context, currentIndex);
              }),
          body: _fragments[currentIndex],
        ),
      );
    });
  }

  _onPop(BuildContext context, int currentIndex) {
    switch (currentIndex) {
      case 3:
        {
          BlocProvider.of<ShowAllServicesBloc>(context)
              .add(PopEvent(context: context));
          return BlocProvider.of<ShowAllServicesBloc>(context)
              .customPop(context)
              .then((value) {
            BlocProvider.of<ShowAllServicesBloc>(context)
                .add(ShowAllServicesEvent(index: 0));
            return value;
          });
        }
      case 2:
        {
          BlocProvider.of<ShowAllServicesBloc>(context)
              .add(PopEvent(context: context));
          return BlocProvider.of<ShowAllServicesBloc>(context)
              .customPop(context)
              .then((value) {
            BlocProvider.of<ShowAllServicesBloc>(context).add(
                ShowServiceDetailsEvent(
                    index: 1,
                    catId: int.parse(
                        BlocProvider.of<ShowAllServicesBloc>(context)
                            .desiredCategoryId!)));
            return value;
          });
        }
      case 1:
        {
          BlocProvider.of<ShowAllServicesBloc>(context)
              .add(PopEvent(context: context));
          return BlocProvider.of<ShowAllServicesBloc>(context)
              .customPop(context)
              .then((value) {
            BlocProvider.of<ShowAllServicesBloc>(context)
                .add(ShowAllServicesEvent());
            return value;
          });
        }
      default:
        {
          return Future.value(true);
        }
    }
  }
}
