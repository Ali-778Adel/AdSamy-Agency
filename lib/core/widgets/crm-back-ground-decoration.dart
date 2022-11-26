import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/palette.dart';

class CRMBackGroundDecoration extends StatelessWidget {
  final Widget child;

  const CRMBackGroundDecoration({Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     height: MediaQuery.of(context).size.height.h,
     width: MediaQuery.of(context).size.width.w,
      decoration: BoxDecoration(
        color: Palette.crmPrimary
      ),
      child: child,



    );
  }
}
