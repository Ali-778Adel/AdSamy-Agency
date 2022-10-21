import 'package:ad_samy/features/profile/presentation/pages/profile-main-page.dart';
import 'package:flutter/material.dart';
import '../../features/client-projects/presentation/pages/client-all-projects-page.dart';
import '../../features/services/presentation/pages/services_page.dart';
import '../widgets/client-cycle-bottom-nav-bar.dart';

class ClientLandingPage extends StatefulWidget {
  const ClientLandingPage({Key? key}) : super(key: key);

  @override
  State<ClientLandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<ClientLandingPage> {
  List<Widget> indexedWidget = [
     ControlClientProjects(),
    const Scaffold(),
    const Scaffold(),
    ServicesMainPage(),
    const ProfileMainPage(),
  ];

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
            currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildBody() {
    return IndexedStack(
      index: currentIndex,
      children: indexedWidget,
    );
  }
}
