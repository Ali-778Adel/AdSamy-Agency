import 'package:ad_samy/core/resources/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CrmDrawer extends StatefulWidget {
  const CrmDrawer({Key? key}) : super(key: key);

  @override
  State<CrmDrawer> createState() => _CrmDrawerState();
}

class _CrmDrawerState extends State<CrmDrawer> {
  bool isProjectExpanded = false;
  bool isOtherExpanded = false;
  @override
  Widget build(BuildContext context) {
    print('build All build method');
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 72.sp),
          width: MediaQuery.of(context).size.width * 60,
          child: Column(
            children: [
              _buildDrawerListTileItem(
                  iconData: Icons.home_outlined,
                  text: 'Dashboard',
                  isExpansion: false,
                  onListTileTapped: () {}),
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  print('just build project');
                  return _buildDrawerExpansionTileItem(
                      text: 'Projects',
                      iconData: Icons.file_copy,
                      leadIconData: isProjectExpanded
                          ? CupertinoIcons.arrow_down_to_line_alt
                          : Icons.arrow_forward_ios_rounded,
                      isForProjects: true,
                      expansionChildren: [
                        _buildExpansionChildItem(
                            text: 'Projects', onTap: () {}),
                        _buildExpansionChildItem(
                            text: 'Templates', onTap: () {}),
                      ],
                      onTrailingTapped: (val) {
                        setState(() {
                          isProjectExpanded = val;
                        });
                      });
                },
              ),
              _buildDrawerListTileItem(
                  iconData: Icons.list_alt,
                  text: 'Tasks',
                  isExpansion: false,
                  onListTileTapped: () {}),
              _buildDrawerListTileItem(
                  iconData: Icons.call,
                  text: 'Leads',
                  isExpansion: false,
                  onListTileTapped: () {}),
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  print('just build Others');
                  return _buildDrawerExpansionTileItem(
                      leadIconData: isOtherExpanded
                          ? CupertinoIcons.arrow_down_to_line_alt
                          : Icons.arrow_forward_ios_rounded,
                      iconData: Icons.blur_circular_sharp,
                      text: 'Others',
                      isForProjects: false,
                      onTrailingTapped: (val) {
                        setState(() {
                          isOtherExpanded = val;
                        });
                      },
                      expansionChildren: [
                        _buildExpansionChildItem(
                            text: 'Team Members', onTap: () {}),
                        _buildExpansionChildItem(
                            text: 'Time Sheets', onTap: () {}),
                        _buildExpansionChildItem(
                            text: 'Settings', onTap: () {}),
                      ]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /**
   * widget function to render the drawer's items that doesn't contain expansion
   **/
  _buildDrawerListTileItem(
      {required IconData iconData,
      required String text,
      required bool isExpansion,
      required Function() onListTileTapped}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.sp),
      child: ListTile(
        horizontalTitleGap: 20.w,
        onTap: onListTileTapped,
        leading: Container(
          height: 24.sp,
          width: 24.w,
          child: Icon(
            iconData,
            color: Palette.lightBlack,
          ),
        ),
        title: Text(
          text,
          style: TextStyle(
              fontFamily: 'Exo',
              fontSize: 16.sp, letterSpacing: 2, color: Palette.lightBlack),
        ),
      ),
    );
  }

  /**widget function to render the drawer's items that  contain expansion children
   * StateFulBuilder for rebuild this widget only when change expansion state {0->for closed,1->for opened}
   **/
  Widget _buildDrawerExpansionTileItem(
      {required String text,
      required IconData iconData,
      required leadIconData,
      required bool isForProjects,
      required List<Widget> expansionChildren,
      required Function(bool) onTrailingTapped}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.sp),
      child: ExpansionTile(
        onExpansionChanged: onTrailingTapped,
        children: expansionChildren,
        backgroundColor: Palette.white,
        title: Text(
          text,
          style: TextStyle(
              fontFamily: 'Exo',
              fontSize: 16.sp, letterSpacing: 2, color: Palette.lightBlack),
        ),
        leading: Container(
          height: 24.sp,
          width: 24.w,
          child: Icon(
            iconData,
            color: Palette.lightBlack,
          ),
        ),
        trailing: Container(
          height: 20.sp,
          width: 20.w,
          child: Icon(
            leadIconData,
            color: Palette.lightBlack,
            size: 16,
          ),
        ),
      ),
    );
  }

  /**
   * this widget for build the expansion item that will render inside _buildDrawerExpansionTileItem when its state in opened
    **/
  _buildExpansionChildItem({required String text, required Function() onTap}) {
    return InkWell(
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.sp),
        child: Text(
          text,
          style: TextStyle(
              fontFamily: 'Exo',
              fontSize: 16.sp, letterSpacing: 2, color: Palette.lightBlack),
        ),
      ),
      onTap: onTap,
    );
  }
}
