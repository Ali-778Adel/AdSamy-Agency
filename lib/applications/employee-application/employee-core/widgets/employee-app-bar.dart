import 'package:ad_samy/core/resources/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployeeAppBar {
  PreferredSizeWidget call() {
    return AppBar(
      elevation: 0.0,
      toolbarHeight: 100.sp,
      backgroundColor:Palette.crmPrimary,
      leading: Builder(builder: (context) {
        return IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        );
      }),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            height: 32.sp,
            width: 32.w,
            child: CircleAvatar(
              child: Image.asset(
                'assets/avatar/man.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
        )
      ],
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
      ),
    );
  }
}
