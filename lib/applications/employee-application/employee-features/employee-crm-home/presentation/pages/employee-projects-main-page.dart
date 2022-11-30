import 'package:ad_samy/applications/client-application/client-core/widgets/drawer.dart';
import 'package:ad_samy/applications/employee-application/employee-core/widgets/employee-app-bar.dart';
import 'package:ad_samy/core/resources/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../../../core/widgets/crm-back-ground-decoration.dart';

class EmployeeProjectsMainPage extends StatelessWidget {
  const EmployeeProjectsMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EmployeeAppBar().call(),
        drawer: CrmDrawer(),
        body: _buildBody(context: context));
  }

  Widget _buildBody({required BuildContext context}) {
    return CRMBackGroundDecoration(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.sp),
              child: Text(
                'Projects',
                style: TextStyle(
                    fontFamily: 'Exo',
                    fontSize: 24.sp,
                    color: Palette.textPrimary),
              ),
            ),
            Container(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                spacing: 4.sp,
                children: [
                  Text(
                    'App',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Palette.black,
                    ),
                  ),
                  Icon(
                    Icons.arrow_right,
                    size: 16.sp,
                    color: Palette.black,
                  ),
                  Text(
                    'projects',
                    style:
                        TextStyle(color: Palette.primaryGrey, fontSize: 16.sp),
                  )
                ],
              ),
            ),
            _buildProjectDetailsTable(context: context)
          ],
        ),
      ),
    );
  }

  Widget _buildProjectDetailsTable({required BuildContext context}) {
    var titleStyle = TextStyle(
        fontFamily: 'Exo', fontSize: 16.sp, color: Palette.textPrimary,fontWeight: FontWeight.w500);
    var contentStyle = TextStyle(
        fontFamily: 'Exo', fontSize: 14.sp, color: Palette.lightBlack);
    var rowDecoration = BoxDecoration(
        border: Border(bottom: BorderSide(color: Palette.primaryGrey)));
    return Container(
      margin: EdgeInsets.only(top: 24.h),
      padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 32.w),
      decoration: BoxDecoration(
          color: Palette.white,
          borderRadius: BorderRadius.all(Radius.circular(2))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 16.h),
            child: Text(
              'My Projects',
              style: contentStyle.copyWith(fontSize: 16.sp),
            ),
          ),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(decoration: rowDecoration, children: [
                TableCell(
                    child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.sp),
                  child: Text(
                    'Title',
                    style: titleStyle,
                    textAlign: TextAlign.start,
                  ),
                )),
                TableCell(
                  child: Text('AdSamy Marketing Agency',style: contentStyle,)
                )
              ]),
              TableRow(decoration: rowDecoration, children: [
                TableCell(
                    child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.sp),
                  child: Text(
                    'Progress',
                    style: titleStyle,
                    textAlign: TextAlign.start,
                  ),
                )),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: new LinearPercentIndicator(
                      // width: MediaQuery.of(context).size.shortestSide,
                      animation: true,
                      lineHeight: 12.0,
                      animationDuration: 2000,
                      percent: 0.9,
                      center: Text("90.0%"),
                      barRadius: Radius.circular(10.sp),
                      backgroundColor: Palette.primaryGrey,
                      progressColor: Palette.darkBlue,
                    ),
                  ),
                )
              ]),
              TableRow(decoration: rowDecoration, children: [
                TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.sp),
                      child: Text(
                        'Client',
                        style: titleStyle,
                        textAlign: TextAlign.start,
                      ),
                    )),
                TableCell(
                    child: Text('Ahmed',style: contentStyle,)
                )
              ]),
              TableRow(decoration: rowDecoration, children: [
                TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.sp),
                      child: Text(
                        'Due Time',
                        style: titleStyle,
                        textAlign: TextAlign.start,
                      ),
                    )),
                TableCell(
                    child: Text('---',style: contentStyle,)
                )
              ]),
              TableRow(decoration: rowDecoration, children: [
                TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.sp),
                      child: Text(
                        'Team',
                        style: titleStyle,
                        textAlign: TextAlign.start,
                      ),
                    )),
                TableCell(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:List.generate(5, (index) =>
                            Container(
                                height: 30.sp,
                                width: 30.sp,
                                margin: EdgeInsets.only(right: 4.sp),
                                child: Icon(Icons.account_circle_outlined,color:Palette.primaryGrey ,))),
                      ),
                    )
                )
              ]),
              TableRow(decoration: rowDecoration, children: [
                TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.sp),
                      child: Text(
                        'Status',
                        style: titleStyle,
                        textAlign: TextAlign.start,
                      ),
                    )),
                TableCell(
                    child: Container(
                      width: 40.w,
                      height: 34.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)
                            ),
                            border: Border.all(
                                color: const Color(0xff0a5079),
                                width: 0
                            ),
                            color: const Color(0xffedf6fb)
                        ),
                      child: Center(child: Text('not Started',style: contentStyle,textAlign: TextAlign.center,)),
                    )
                )
              ]),
              TableRow(decoration: rowDecoration, children: [
                TableCell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.sp),
                      child: Text(
                        'Actions',
                        style: titleStyle,
                        textAlign: TextAlign.start,
                      ),
                    )),
                TableCell(
                    child: Text('---',style: contentStyle,)
                )
              ]),
            ],
          )
        ],
      ),
    );
  }
}
