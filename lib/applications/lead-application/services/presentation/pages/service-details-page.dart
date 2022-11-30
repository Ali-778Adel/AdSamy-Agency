// ignore_for_file: file_names

import 'package:ad_samy/applications/lead-application/services/presentation/lead-blocs/lead-service-details-bloc/service-details-events.dart';
import 'package:ad_samy/core/resources/palette.dart';
import 'package:ad_samy/core/widgets/loading-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../lead-blocs/lead-home-page-bloc/bloc.dart';
import '../lead-blocs/lead-home-page-bloc/bloc_events.dart';
import '../lead-blocs/lead-service-details-bloc/service-details-states.dart';
import '../lead-blocs/lead-service-details-bloc/service-detaols-bloc.dart';
import '../widgets/lead-app-bar.dart';
import '../widgets/page-title.dart';
import '../widgets/service-details.dart';
import 'package:ad_samy/di/dependency_injection_container.dart' as da;



class ServiceDetailsPage extends StatelessWidget {
  const ServiceDetailsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LeadAppBar().call(context: context),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocProvider(create: (context)=>da.sl<ServiceDetailsBloc>()..add(ShowServiceDetailsEvent1(serviceId: 66)),
      child:BlocBuilder<ServiceDetailsBloc, ShowServiceDetailsStates1>(
          builder: (context, state) {
              switch(state.serviceDetailsRequestStatus){
                case ServiceDetailsRequestStatus.loading:{
                  return const Center(child: LoadingWidget(),);
                }
                case ServiceDetailsRequestStatus.failure:{
                  return Center(child: Text(
                      state.erroMesasge??
                          'something went wrong please try again later '),);
                }
                case ServiceDetailsRequestStatus.success:{
                  return SafeArea(
                      child: Stack(
                        children: [
                          Positioned(
                              top: 20.sp,
                              left: 0.0,
                              right: 0.0,
                              height: 40.sp,
                              child: PageTitle(title: 'Adsamy Marketing Agency',)),
                          Positioned(
                              top: 50.h,
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
                                      // BlocProvider.of<ShowAllServicesBloc>(context).add(
                                      //     ShowLeadingFormEvent(index: 2));

                                   Navigator.pushNamed(context, 'service_details/lead_form');
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


            return const SizedBox();
          }
      ) ,

    );



  }

}
