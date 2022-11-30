import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/resources/palette.dart';
@immutable
class EmployeeCycleNavBar extends StatelessWidget {
  final void Function(int)onTap;
  int currentIndex=0;
  EmployeeCycleNavBar({Key? key,required this.onTap,required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
        backgroundColor: Palette.darkBlue,
        onTap: onTap,
        currentIndex:currentIndex,
        items:  [
          _bottomNavBarItem( CupertinoIcons.home, 'Home'),
          _bottomNavBarItem( CupertinoIcons.square_list, 'Tasks'),
          _bottomNavBarItem( CupertinoIcons.bell, 'Notification'),
          _bottomNavBarItem( CupertinoIcons.profile_circled, 'Profile'),
        ]
    );
  }

  BottomNavigationBarItem _bottomNavBarItem(IconData iconData,String label ){
    return BottomNavigationBarItem(
        icon: Icon(iconData,color: Colors.yellow,),
        label: label,
        backgroundColor: Palette.darkBlue

    );
  }
}

