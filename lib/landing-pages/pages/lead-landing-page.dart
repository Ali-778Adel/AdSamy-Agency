import 'package:flutter/material.dart';

import '../../applications/lead-application/services/presentation/pages/lead-home-page-controller.dart';

<<<<<<< HEAD
//
// class LeadLandingPage extends StatefulWidget {
//   const LeadLandingPage({Key? key}) : super(key: key);
//
//   @override
//   State<LeadLandingPage> createState() => _LandingPageState();
// }
//
// class _LandingPageState extends State<LeadLandingPage> {
//   List<Widget> indexedWidget = [
//     LeadHomePageController1(),
//     const Scaffold(),
//     const Scaffold(),
//     const Scaffold(),
//     const Scaffold(),
//   ];
//
//   int currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _buildBody(),
//     );
//   }
//
//   Widget _buildBody() {
//     return IndexedStack(
//       index: currentIndex,
//       children: indexedWidget,
//     );
//   }
// }
=======

class LeadLandingPage extends StatefulWidget {
  const LeadLandingPage({Key? key}) : super(key: key);

  @override
  State<LeadLandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LeadLandingPage> {
  List<Widget> indexedWidget = [
    LeadHomePageController(),
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
>>>>>>> 230a0cab7852a1b5ee14ebb56c6bad628c9998c7
