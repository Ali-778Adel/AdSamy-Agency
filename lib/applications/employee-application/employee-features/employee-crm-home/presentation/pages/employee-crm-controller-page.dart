import 'package:ad_samy/applications/client-application/client-core/widgets/client-app-bar.dart' show ClientAppBar;
import 'package:ad_samy/applications/client-application/client-core/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'employee-crm-home-page.dart';

class EmployeeCrmController extends StatelessWidget {
  const EmployeeCrmController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  Drawer(
        backgroundColor: Colors.white,
        elevation: 0.0,
        child: CrmDrawer(),
      ),
      appBar: ClientAppBar().call(),
      body:ClientCrmHomePage()
    );
  }
}
