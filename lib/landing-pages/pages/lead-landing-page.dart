import 'package:flutter/material.dart';

import '../../applications/lead-application/services/presentation/pages/lead-home-page-controller.dart';

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