import 'package:ad_samy/core/widgets/intro-background-container.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import '../../../../../core/resources/core-dimens.dart';
import '../widgets/lead-app-bar.dart';

=======

import '../../../../../core/resources/core-dimens.dart';
>>>>>>> 230a0cab7852a1b5ee14ebb56c6bad628c9998c7

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      appBar: LeadAppBar().call(context: context),
=======
>>>>>>> 230a0cab7852a1b5ee14ebb56c6bad628c9998c7
      body: IntroBackGroundContainer1(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                height: CoreDimens.cardH5,
                width: double.infinity,
                child: Image.asset(
                  'assets/success.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
                child: Container(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                      '\n\nyour request sent successfully to our support team ,we will contact you as soon as possible. ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontWeight: FontWeight.bold),
                    )))
          ],
        ),
      ),
    );
  }
}
