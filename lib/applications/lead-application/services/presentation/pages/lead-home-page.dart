<<<<<<< HEAD
import 'package:ad_samy/applications/lead-application/services/presentation/widgets/lead-app-bar.dart';
import 'package:ad_samy/core/resources/core-dimens.dart';
import 'package:ad_samy/core/widgets/intro-background-container.dart';
import 'package:ad_samy/utils/ext/context.dart';
=======
import 'package:ad_samy/core/resources/core-dimens.dart';
import 'package:ad_samy/core/widgets/intro-background-container.dart';
import 'package:ad_samy/core/widgets/loading-widget.dart';
>>>>>>> 230a0cab7852a1b5ee14ebb56c6bad628c9998c7
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/lists.dart';
import '../../data/data_source/services_static_data.dart';
<<<<<<< HEAD

import '../lead-blocs/lead-home-page-bloc/bloc.dart';
import '../lead-blocs/lead-home-page-bloc/bloc_states.dart';

import '../lead-blocs/lead-service-details-bloc/service-details-events.dart';
import '../lead-blocs/lead-service-details-bloc/service-detaols-bloc.dart';
=======
import '../show_services_bloc/bloc.dart';
import '../show_services_bloc/bloc_events.dart';
import '../show_services_bloc/bloc_states.dart';
>>>>>>> 230a0cab7852a1b5ee14ebb56c6bad628c9998c7
import '../widgets/carousel-item.dart';
import '../widgets/contact-us-item.dart';
import '../widgets/our-services-item.dart';
import '../widgets/our-team-item.dart';
import '../widgets/our-works-item.dart';
import '../widgets/shimmer-widget.dart';


Map<String, Widget> sectionsTitles(BuildContext context) {
  return {
    'ourOffers': Text(
      'Our Offers',
      style: Theme.of(context).textTheme.headline1,
    ),
    'ourServices': Text(
      'Our Services',
      style: Theme.of(context).textTheme.headline1,
    ),
    'ourTeam': Text(
      'Our Team',
      style: Theme.of(context).textTheme.headline1,
    ),
    'ourWorks': Text(
      'Our Works',
      style: Theme.of(context).textTheme.headline1,
    ),
    'contactUs': Text(
      'ContactUs',
      style: Theme.of(context).textTheme.headline1,
    ),
  };
}

class LeadHomePage extends StatelessWidget {
   LeadHomePage({Key? key}) : super(key: key);

  final serviceData=ServiceStaticData.employeesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
   appBar: LeadAppBar().call(context: context),
=======
>>>>>>> 230a0cab7852a1b5ee14ebb56c6bad628c9998c7
      body: _buildBody(context: context),
    );
  }

  Widget _buildBody({required BuildContext context}) {
    return IntroBackGroundContainer1(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionsTitleWidget(context, 'ourOffers'),
            _buildCarouselSection(),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionsTitleWidget(context, 'ourServices'),
                      _buildOurServicesSection(),
                      _sectionsTitleWidget(context, 'ourWorks'),
                      _buildOurWorksSection(),
                      _sectionsTitleWidget(context, 'ourTeam'),
                      _buildOurTeamSection(),
                      _sectionsTitleWidget(context, 'contactUs'),
                      _contactUsSection(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselSection() {
    return Container(
      child: BlocBuilder<ShowAllServicesBloc, ServicesStates>(
          builder: (context, state) {
        if (state is ShowAllServicesStates) {
          if (state.showAllServicesStatus == ShowAllServicesStatus.success) {
            final data = state.serviceEntity!.data;
            return CarouselSlider(
              options: CarouselOptions(
<<<<<<< HEAD
                scrollPhysics:ScrollPhysics(parent: BouncingScrollPhysics()),
=======
>>>>>>> 230a0cab7852a1b5ee14ebb56c6bad628c9998c7
                  height: 400.0.sp,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  viewportFraction: .9),
<<<<<<< HEAD
              items:List.generate(data!.categories!.length, (index)
              => CarouselItem(imageUrl: '${data.imageBaseUrl}/${data.categories![index].catImage}'))

            );
          } else {
            return CustomShimmerWidget(child: CarouselItem(imageUrl: '',));
=======
              items: data!.categories!.map((i) {
                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (BuildContext context, index) {
                    return CarouselItem(
                      imageUrl: '${data.imageBaseUrl}/${i.catImage}',
                    );
                  },
                );
              }).toList(),
            );
          } else {
            return LoadingWidget();
>>>>>>> 230a0cab7852a1b5ee14ebb56c6bad628c9998c7
          }
        } else {
          return Center();
        }
      }),
      width: double.infinity,
      height: CoreDimens.cardH4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    );
  }

  Widget _buildOurServicesSection() {
    return BlocBuilder<ShowAllServicesBloc, ServicesStates>(
        builder: (context, state) {
      if (state is ShowAllServicesStates) {
        if (state.showAllServicesStatus == ShowAllServicesStatus.success) {
          final data = state.serviceEntity!.data!.categories!;
          return Container(
<<<<<<< HEAD
            height: 140.h,
=======
            height: 140.sp,
>>>>>>> 230a0cab7852a1b5ee14ebb56c6bad628c9998c7
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: OurServicesItem(
                      imgPath: imgPaths[index],
                      serviceTitle: data[index].catName,
                    ),
                    onTap: () {
<<<<<<< HEAD
                      context.pushNamed(context,'service_details');
                      // BlocProvider.of<ServiceDetailsBloc>(context).add(
                      //     ShowServiceDetailsEvent1(
                      //       serviceId: data[index].catId!
                      //          ));
=======
                      BlocProvider.of<ShowAllServicesBloc>(context).add(
                          ShowServiceDetailsEvent(
                              catId: data[index].catId, index: 1));
>>>>>>> 230a0cab7852a1b5ee14ebb56c6bad628c9998c7
                    },
                  );
                }),
          );
        } else if (state.showAllServicesStatus ==
            ShowAllServicesStatus.loading) {
          return CustomShimmerWidget(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List<OurServicesItem>.filled(2, OurServicesItem()),
          ));
        } else {
          return SizedBox();
        }
      }
      return SizedBox();
    });
  }

  Widget _buildOurWorksSection() {
    return Container(
      height: 230.sp,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          OurWorksItem(
            imageUrl: 'assets/our_works/forchetta.jpg',
            siteUrl: 'https://forchettauae.com/',
            workName: 'ForChetta',
            description: 'Food catrin website',
          ),
          OurWorksItem(
            imageUrl: 'assets/our_works/elite.jpg',
            siteUrl: 'https://elitetasty.com/',
            workName: 'Elite',
            description: 'Food catrin website',
          ),
          OurWorksItem(
            imageUrl: 'assets/our_works/greencandles.jpg',
            siteUrl: 'https://elitetasty.com/',
            workName: 'Green Candles',
            description: 'Economic Website',
          ),
          OurWorksItem(
            imageUrl: 'assets/our_works/lebskom.jpg',
            siteUrl: 'https://elitetasty.com/',
            workName: 'Lebskom',
            description: 'clothes & fashion website',
          ),
        ],
      ),
    );
  }

  Widget _buildOurTeamSection() {
    return BlocBuilder<ShowAllServicesBloc, ServicesStates>(
        builder: (context, state) {
      return Container(
height: 145.sp,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: serviceData.length,
            itemBuilder: (context,index){
          return OurTeamItem(
            EName: serviceData[index]['EName'],
            EAvatar: serviceData[index]['EAvatar'],
            EPosition: serviceData[index]['EPosition'],

          );
        }),
      );
    });
  }

  Widget _contactUsSection() {
    return Container(
      height: 70.sp,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          ContactUsItem(
            imageAssets: 'assets/social/twitter.png',
            url: 'https://www.twitter.com/adsamyagency',
          ),
          ContactUsItem(
            imageAssets: 'assets/social/instagram.png',
            url: 'https://www.instagram.com/adsamyagency/',
          ),
          ContactUsItem(
            imageAssets: 'assets/social/behance.png',
            url: 'https://www.behance.net/adsamyagency',
          ),
          ContactUsItem(
            imageAssets: 'assets/social/facebook.png',
            url: 'https://www.facebook.com/Adsamyagency/',
          ),
          ContactUsItem(
            imageAssets: 'assets/social/linkedin.png',
            url: 'Http://Www.Linkedin.com/company/adsamyagency',
          ),
        ],
      ),
    );
  }

  Widget _sectionsTitleWidget(BuildContext context, String titleKey) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: sectionsTitles(context)[titleKey],
    );
  }
}
