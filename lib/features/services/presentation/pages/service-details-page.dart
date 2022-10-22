// ignore_for_file: file_names

import 'package:ad_samy/core/widgets/back-ground-container.dart';
import 'package:ad_samy/core/resources/palette.dart';
import 'package:ad_samy/core/widgets/loading-widget.dart';
import 'package:ad_samy/features/services/presentation/show_services_bloc/bloc.dart';
import 'package:ad_samy/features/services/presentation/show_services_bloc/bloc_events.dart';
import 'package:ad_samy/features/services/presentation/widgets/page-title.dart';
import 'package:ad_samy/features/services/presentation/widgets/search.dart';
import 'package:ad_samy/features/services/presentation/widgets/service-details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../show_services_bloc/bloc_states.dart';


class ServiceDetailsPage extends StatelessWidget {
  const ServiceDetailsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<ShowAllServicesBloc, ServicesStates>(
      builder: (context, state) {
        if(state is ShowServiceDetailsStates){
          switch(state.showAllServicesStatus){
            case ShowAllServicesStatus.loading:{
              return const Center(child: LoadingWidget(),);
            }
            case ShowAllServicesStatus.failure:{
              return Center(child: Text(
                  state.errorMessage??
                      'something went wrong please try again later '),);
            }
            case ShowAllServicesStatus.success:{
             return SafeArea(
                 child: Stack(
                   children: [
                     BackGroundContainer(
                         child: Column(
                           children: const [
                             PageTitle(title: 'Welcome to AdSamy Agency.'),
                             // SearchWidget(),

                           ],
                         )),
                     Positioned(
                         top: 150.h,
                         left: 0,
                         right: 0,
                         bottom: 0,
                         child:  Container(
                           decoration:  BoxDecoration(
                               color: Palette.white.withOpacity(.70),
                               borderRadius:const BorderRadius.only(
                                   topLeft: Radius.circular(35),
                                   topRight: Radius.circular(35))),

                           child: Padding(
                             padding:  EdgeInsets.all(10.w),
                             child: ServiceDetailsWidget(
                               state: state,
                               onTap:(){
                                 BlocProvider.of<ShowAllServicesBloc>(context).add(
                                     ShowLeadingFormEvent(index: 2));
                               } ,
                             ),
                           ),
                         ))
                   ],
                 ));
            }
            default :{
              return const SizedBox();
            }
          }

        }
        return const SizedBox();
      }
    );
  }
  Widget _buildDynamicBody({BuildContext? context}){
    return SafeArea(
        child: Stack(
          children: [
            BackGroundContainer(
                child: Column(
                  children: const [
                    PageTitle(title: 'Welcome to AdSamy Agency.'),
                    // SearchWidget(),

                  ],
                )),
            Positioned(
                top: 150.h,
                left: 0,
                right: 0,
                bottom: 0,
                child:  Container(
                  decoration:  BoxDecoration(
                      color: Palette.white.withOpacity(.70),
                      borderRadius:const BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35))),

                  child: Padding(
                    padding:  EdgeInsets.all(10.w),
                    child: ServiceDetailsWidget(
                      onTap:(){
                        BlocProvider.of<ShowAllServicesBloc>(context!).add(
                            ShowLeadingFormEvent(index: 2));
                      } ,
                    ),
                  ),
                ))
          ],
        ));
  }

}
