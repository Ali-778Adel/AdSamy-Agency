
// ignore_for_file: file_names

import 'package:ad_samy/features/client-projects/presentation/widgets/client-page-header.dart';
import 'package:flutter/material.dart';


class ClientNotificationsPage extends StatelessWidget {
  const ClientNotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context){
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const ClientPageHeader(),
             Expanded(
               child: SizedBox(
                height: MediaQuery.of(context).size.height,
                 width:  double.infinity,
                 child: Center(
                   child: Text(
                     'no Notifications for you yet!',
                     style: Theme.of(context).textTheme.bodyText1,),)),
             )
        ],
        ),
      ),
    );
  }
}
