import 'package:ad_samy/core/resources/palette.dart';
import 'package:ad_samy/core/widgets/crm-back-ground-decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClientCrmHomePage extends StatelessWidget {
  const ClientCrmHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context: context),
    );
  }

  Widget _buildBody({required BuildContext context}) {
    return CRMBackGroundDecoration(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding:const EdgeInsets.all(16.0) ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProjectsContainer(context: context),
              _buildActivitiesWidget(context: context),
              _buildProjectsTable()
            ],
          ),
        ));
  }

  Widget _buildProjectsContainer({required BuildContext context}) {
    return Container(
      height: 102.h,
      decoration: BoxDecoration(
          color: Palette.white,
          borderRadius: BorderRadius.all(Radius.circular(2)),
          boxShadow: [
            BoxShadow(
                color: Palette.darkBlue,
                blurRadius: 0,
                offset: Offset(0.0, 4.0))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '3',
                  style: TextStyle(
                      color: Palette.lightBlack,
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Container(
                    height: 20.sp,
                    width: 20.w,
                    child: Icon(
                      Icons.file_copy,
                      color: Palette.darkBlue,
                    ))
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text('Project-Panding',
                style: TextStyle(
                    color: Palette.lightBlack,
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w500)),
          )
        ],
      ),
    );
  }

  Widget _buildActivitiesWidget({required BuildContext context}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 40.sp),
      height: MediaQuery.of(context).size.height * .42,
      padding: EdgeInsets.all(16.0.sp),
      decoration: BoxDecoration(
          color: Palette.white,
          borderRadius: BorderRadius.all(Radius.circular(2))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              child: Text(
            'Last Activities',
            style: TextStyle(
                color: Palette.lightBlack,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
          )),
          Container(
              padding: EdgeInsets.zero,
              height: MediaQuery.of(context).size.height * .35,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  _buildLastActivitiesItme(context: context),
                  _buildLastActivitiesItme(context: context),
                  _buildLastActivitiesItme(context: context),
                  _buildLastActivitiesItme(context: context),
                ],
              ))
        ],
      ),
    );
  }

  Widget _buildLastActivitiesItme({required BuildContext context}) {
    return ListTile(
      minVerticalPadding: 16.sp,
      minLeadingWidth: 20.sp,
      leading: Container(
        height: 20.sp,
        width: 20.sp,
        child: Image.asset(
          'assets/avatar/man.png',
          fit: BoxFit.fill,
        ),
      ),
      title: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: 'Ali  ',
            style: TextStyle(
              fontFamily: 'Exo',
              color: Palette.textPrimary,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
          ),
          TextSpan(
            text: '6 days ago',
            style: TextStyle(
              color: Palette.lightBlack,
              fontWeight: FontWeight.w300,
              fontSize: 12.sp,
            ),
          )
        ]),
      ),
      subtitle: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: 'assigned you to task  ',
            style: TextStyle(
              fontFamily: 'Exo',
              color: Palette.lightBlack,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
          ),
          TextSpan(
            text: '(Task #10) - ToDo Manar',
            style: TextStyle(
              fontFamily: 'Exo',
              color: Palette.textPrimary,
              fontSize: 16.sp,
            ),
          )
        ]),
      ),
    );
  }

  Widget _buildProjectsTable() {
    var titleStyle = TextStyle(
      color: Palette.black,
      fontSize: 16.sp,
      fontFamily: "Exo",
    );
    var contentStyle = TextStyle(
      color: Palette.textPrimary,
      fontSize: 16.sp,
      fontFamily: "Exo",
    );
    return Container(
      decoration: BoxDecoration(
          color: Palette.white,
          borderRadius: BorderRadius.all(Radius.circular(2))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16.sp),
            child: Text(
              'My Projects',
              style: TextStyle(
                color: Palette.lightBlack,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: "Exo",
              ),
            ),
          ),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Palette.primaryGrey,
                  ))),
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Title',
                          textAlign: TextAlign.start,
                          style: titleStyle,
                        ),
                      ),
                    ),
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'DueTime',
                        textAlign: TextAlign.center,
                        style: titleStyle,
                      ),
                    )),
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Status',
                        textAlign: TextAlign.center,
                        style: titleStyle,
                      ),
                    )),
                  ]),
              TableRow(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Palette.primaryGrey,
                  ))),
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'AdSamy Marketing',
                          textAlign: TextAlign.start,
                          style: contentStyle,
                        ),
                      ),
                    ),
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        '---',
                        textAlign: TextAlign.center,
                        style: contentStyle,
                      ),
                    )),
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'not Started',
                        textAlign: TextAlign.center,
                        style: contentStyle,
                      ),
                    )),
                  ]),
              TableRow(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Palette.primaryGrey,
                  ))),
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'AdSamy',
                          textAlign: TextAlign.start,
                          style: contentStyle,
                        ),
                      ),
                    ),
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        '---',
                        textAlign: TextAlign.center,
                        style: contentStyle,
                      ),
                    )),
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'not started',
                        textAlign: TextAlign.center,
                        style: contentStyle,
                      ),
                    )),
                  ]),
              TableRow(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Palette.primaryGrey,
                  ))),
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'CRS',
                          textAlign: TextAlign.start,
                          style: contentStyle,
                        ),
                      ),
                    ),
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        '---',
                        textAlign: TextAlign.center,
                        style: contentStyle,
                      ),
                    )),
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'not started',
                        textAlign: TextAlign.center,
                        style: contentStyle,
                      ),
                    )),
                  ]),
            ],
          )
        ],
      ),
    );
  }
}
