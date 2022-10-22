import 'package:ad_samy/core/widgets/back-ground-container.dart';
import 'package:ad_samy/core/widgets/loading-widget.dart';
import 'package:ad_samy/features/authentiacation/presentation/resources/dimens.dart';
import 'package:ad_samy/core/resources/palette.dart';
import 'package:ad_samy/features/authentiacation/presentation/widgets/spacer-v.dart';
import 'package:ad_samy/features/services/presentation/pages/leading-info-page.dart';
import 'package:ad_samy/features/services/presentation/pages/service-details-page.dart';
import 'package:ad_samy/features/services/presentation/resources/services-dimens.dart';
import 'package:ad_samy/features/services/presentation/show_services_bloc/bloc.dart';
import 'package:ad_samy/features/services/presentation/show_services_bloc/bloc_events.dart';
import 'package:ad_samy/features/services/presentation/widgets/card.dart';
import 'package:ad_samy/features/services/presentation/widgets/page-title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../show_services_bloc/bloc_states.dart';
import '../widgets/grid-view.dart';
import '../widgets/retry-conntection.dart';
import 'order-success-page.dart';

class ServicesMainPage extends StatelessWidget {
  final List<Widget> _fragments = [
    const ServicesMain(),
    const ServiceDetailsPage(),
     LeadingInfoPage(),
     const OrderSuccess(),
  ];
  ServicesMainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowAllServicesBloc, ServicesStates>(
        builder: (context, state) {
      int currentIndex =
          BlocProvider.of<ShowAllServicesBloc>(context).currentIndex;
      return WillPopScope(
        onWillPop: () {
          switch(currentIndex){
            case 3:{
              BlocProvider.of<ShowAllServicesBloc>(context)
                  .add(PopEvent(context: context));
              return BlocProvider.of<ShowAllServicesBloc>(context)
                  .customPop(context).then((value) {
                BlocProvider.of<ShowAllServicesBloc>(context)
                    .add(ShowAllServicesEvent(index: 0));
                return value;
              });

            }
            case 2:{
              BlocProvider.of<ShowAllServicesBloc>(context)
                  .add(PopEvent(context: context));
              return BlocProvider.of<ShowAllServicesBloc>(context)
                  .customPop(context).then((value) {
                BlocProvider.of<ShowAllServicesBloc>(context)
                    .add(ShowServiceDetailsEvent(index: 1));
                return value;
              });

            }
            case 1:{
              BlocProvider.of<ShowAllServicesBloc>(context)
                  .add(PopEvent(context: context));
              return BlocProvider.of<ShowAllServicesBloc>(context)
                  .customPop(context).then((value) {
                BlocProvider.of<ShowAllServicesBloc>(context)
                    .add(ShowAllServicesEvent());
                return value;
              });
            }
            default:{
              return Future.value(true);
            }
          }

        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: _fragments[currentIndex],
        ),
      );
    });
  }
}

class ServicesMain extends StatefulWidget {
  const ServicesMain({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ServicesMain();
  }
}

class _ServicesMain extends State<ServicesMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      bottom: false,
      maintainBottomViewPadding: false,
      child: BackGroundContainer(
          child: Column(
        children: [
          const PageTitle(title: 'Welcome to AdSamy Agency.'),
          // const SearchWidget(),
          SpacerV(
            value: Dimens.space16,
          ),
          const MyCard(),
          _buildText(),
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: BlocBuilder<ShowAllServicesBloc, ServicesStates>(
                  builder: (context, state) {
                if (state is ShowAllServicesStates) {
                  switch(state.showAllServicesStatus){
                    case ShowAllServicesStatus.loading:{
                       return const LoadingWidget();
                    }
                    case ShowAllServicesStatus.success:{

                      return  ServicesWidget(
                         services: state.serviceEntity!,
                          showAllServicesStates: state,
                          onTap: (){
                           // BlocProvider.of<ShowAllServicesBloc>(context).add(
                           //     ShowServiceDetailsEvent(
                           //         index: 1,catId: state.serviceEntity!.data!.categories![].catId));
                          });
                    }
                    case ShowAllServicesStatus.failure:{
                     return RetryConnection(
                       errorMessage: state.errorMessage!,
                       onRefreshTap: (){
                         BlocProvider.of<ShowAllServicesBloc>(context).add(ShowAllServicesEvent());
                       },
                     );
                    }
                    default:
                      return Container();
                  }

                }
                return const Center(child: Text('no data'),);

              }))
        ],
      )),
    );
  }

  Widget _buildText() {
    return Container(
      height: ServicesDimens.h3,
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Text(
          'Our Services',
          style: TextStyle(
              fontSize: ServicesDimens.subtitle1,
              fontWeight: FontWeight.w600,
              color: Palette.darkBlue),
        ),
      ),
    );
  }
}
