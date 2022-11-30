import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/resources/palette.dart';
class ClientCycleNavBar extends StatelessWidget {
  final void Function(int)onTap;
   int currentIndex=0;
  ClientCycleNavBar({Key? key,required this.onTap,required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
        backgroundColor: Palette.darkBlue,
        onTap: onTap,
        currentIndex:currentIndex,
        items:  [
          _bottomNavBarItem( CupertinoIcons.home, 'Home'),
          _bottomNavBarItem( Icons.chrome_reader_mode, 'CRM'),
          _bottomNavBarItem( CupertinoIcons.bell, 'Notification'),
          _bottomNavBarItem( CupertinoIcons.chat_bubble_2, 'Chat '),
          _bottomNavBarItem( CupertinoIcons.profile_circled, 'Profile'),
        ]);
  }

  BottomNavigationBarItem _bottomNavBarItem(IconData iconData,String label, ){
    return BottomNavigationBarItem(
        icon: Icon(iconData,color: Colors.yellow,),
        label: label,
        backgroundColor: Palette.darkBlue

    );
  }
}

