<<<<<<< HEAD
import 'package:ad_samy/applications/lead-application/services/presentation/pages/lead-home-page.dart';
=======
>>>>>>> 230a0cab7852a1b5ee14ebb56c6bad628c9998c7
import 'package:flutter/material.dart';
import '../../applications/client-application/client-features/client-projects/presentation/pages/client-all-projects-page.dart';
import '../../applications/client-application/client-features/client-projects/presentation/pages/client-notification-page.dart';
import '../../applications/lead-application/services/presentation/pages/lead-home-page-controller.dart';
import '../../core/core-features/profile/presentation/pages/profile-main-page.dart';
import '../widgets/client-cycle-bottom-nav-bar.dart';

class ClientLandingPage extends StatefulWidget {
  final int?navIndex;
  const ClientLandingPage({Key? key,this.navIndex}) : super(key: key);

  @override
  State<ClientLandingPage> createState() => _LandingPageState(navIndex: navIndex);
}

class _LandingPageState extends State<ClientLandingPage> {
  List<Widget> indexedWidget = [
    LeadHomePageController(),
    ControlClientProjects(),
    const ClientNotificationsPage(),
    const Scaffold(),
    const ProfileMainPage(),
  ];
    int? navIndex;
  _LandingPageState({this.navIndex});

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(),
      bottomNavigationBar: ClientCycleNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            navIndex != null ? currentIndex=navIndex=index:  currentIndex=index;
          });
        },
      ),
    );
  }

  Widget _buildBody() {
    int wichIndex=navIndex!=null?currentIndex=navIndex!:currentIndex;
    return IndexedStack(
      index: wichIndex,
      children: indexedWidget,
    );
  }
}
