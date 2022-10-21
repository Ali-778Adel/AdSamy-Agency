import 'package:ad_samy/features/profile/presentation/pages/profile-main-page.dart';
import 'package:ad_samy/features/team-projects/presentation/pages/employee-main-pade.dart';
import 'package:flutter/material.dart';
import '../../features/team-projects/presentation/pages/notification-demo.dart';
import '../../features/team-projects/presentation/pages/today-tasks-page.dart';
import '../widgets/employee-cycle-bottom-nav-bar.dart';

class EmployeeLandingPage extends StatefulWidget {
  const EmployeeLandingPage({Key? key}) : super(key: key);

  @override
  State<EmployeeLandingPage> createState() => _EmployeeLandingPageState();
}

class _EmployeeLandingPageState extends State<EmployeeLandingPage> {
  List<Widget> indexedWidget = [
    const EmployeeNavigationController(),
    const EmployeeTasksPageNavigationController(),
    const EmployeeNotificationsPageNavigationController(),
    const ProfileMainPage(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(),
      bottomNavigationBar: EmployeeCycleNavBar(
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
