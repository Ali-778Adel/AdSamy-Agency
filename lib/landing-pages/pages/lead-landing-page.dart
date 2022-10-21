import 'package:ad_samy/features/services/presentation/pages/services_page.dart';
import 'package:ad_samy/landing-pages/widgets/lead-bottom-nav-bar.dart';
import 'package:flutter/material.dart';

class LeadLandingPage extends StatefulWidget {
  const LeadLandingPage({Key? key}) : super(key: key);

  @override
  State<LeadLandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LeadLandingPage> {
  List<Widget> indexedWidget = [
    ServicesMainPage(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(),
      // bottomNavigationBar: MyBottomNavBar(
      //   currentIndex: currentIndex,
      //   onTap: (index) {
      //     setState(() {
      //       currentIndex = index;
      //     });
      //   },
      // ),
    );
  }

  Widget _buildBody() {
    return IndexedStack(
      index: currentIndex,
      children: indexedWidget,
    );
  }
}
