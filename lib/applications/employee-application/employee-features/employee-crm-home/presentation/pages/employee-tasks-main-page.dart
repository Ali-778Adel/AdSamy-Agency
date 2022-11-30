import 'package:ad_samy/applications/client-application/client-core/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/resources/palette.dart';
import '../../../../employee-core/widgets/employee-app-bar.dart';

class EmployeeTasksMainPage extends StatelessWidget {
  const EmployeeTasksMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmployeeAppBar().call(),
      drawer: CrmDrawer(),
      body: _buildBody(context: context),
    );
  }

  Widget _buildBody({required BuildContext context}){
    return Container(
      height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 8.sp),
                child: Text(
                  'Tasks',
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
                      'Tasks',
                      style:
                      TextStyle(color: Palette.primaryGrey, fontSize: 16.sp),
                    )
                  ],
                ),
              ),
              _buildTaskItem(context)
            ],
          ),
        )
    );
  }

  Widget _buildTaskItem(BuildContext context){
    var titleStyle=TextStyle(color: Palette.lightBlack,fontFamily: 'Exo',fontSize: 16.sp,fontWeight: FontWeight.w500);
    var contentStyle=TextStyle(color: Palette.lightGrey,fontFamily: 'Exo',fontSize: 16.sp,fontWeight: FontWeight.w600);
    return Container(
      height: MediaQuery.of(context).size.height*.80,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.symmetric(vertical: 24.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(2)),
        color:Palette.crmPrimary,
        boxShadow: [
          BoxShadow(
            color: Palette.black,
            blurRadius: 0.0,
            offset: Offset(0.0,-2.0)
          ),
        ]
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 32.h),
            child: Text('New',style: titleStyle,),
          ),
          Padding(
              padding: EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Palette.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(16.0.sp),
                  // margin: EdgeInsets.all(16.0.sp),
                  child: Text('ToDo Manar',style: titleStyle,),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                  child: RichText(text: TextSpan(
                    children: [
                      TextSpan(text: 'Project :',style: titleStyle),
                      TextSpan(text: 'AdSamy Marketing Agency  ',style: contentStyle),
                    ]
                  )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                  child: RichText(text: TextSpan(
                      children: [
                        TextSpan(text: 'Client :',style: titleStyle),
                        TextSpan(text: 'AdSamy ',style: contentStyle),
                      ]
                  )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                  child: RichText(text: TextSpan(
                      children: [
                        TextSpan(text: 'Created :',style: titleStyle),
                        TextSpan(text: '10-11-2022',style: contentStyle),
                      ]
                  )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                  child: RichText(text: TextSpan(
                      children: [
                        TextSpan(text: 'Start Date :',style: titleStyle),
                        TextSpan(text: '---',style: contentStyle),
                      ]
                  )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical:8,horizontal: 12),
                  child: RichText(text: TextSpan(
                      children: [
                        TextSpan(text: 'Due To :',style: titleStyle),
                        TextSpan(text: '20-12-2022',style: contentStyle),
                      ]
                  )),
                ),

              ],
            ),
            ),


          )

        ],
      ),
    );
  }
}
