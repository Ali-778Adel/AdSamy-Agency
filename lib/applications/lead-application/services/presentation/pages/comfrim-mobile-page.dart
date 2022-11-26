import 'package:ad_samy/core/resources/palette.dart';
import 'package:ad_samy/core/widgets/intro-background-container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmMobilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ConfirmMobilePage();
  }
}

class _ConfirmMobilePage extends State<ConfirmMobilePage> {
  // ConfirmMobilePage({Key? key}) : super(key: key);
  final _focusNodes = List.generate(4, (index) => FocusNode());
  final _digitsControllers = List<TextEditingController>.generate(
      4, (index) => TextEditingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: IntroBackGroundContainer1(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 148.sp,
                  width: 148.w,
                  child: CircleAvatar(
                    backgroundColor: Palette.primaryBlue,
                    child: Center(
                      child: Icon(
                        Icons.attach_email,
                        size: 40.sp,
                        color: Palette.darkBlue,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 24.sp),
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                          height: 2.sp,
                        ),
                        children: [
                          TextSpan(
                              text: 'please Enter 4 digit code sent to \n',
                              style: Theme.of(context).textTheme.bodyText1),
                          TextSpan(
                              text: '               01010551144 \n',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Palette.darkLight)),
                        ]),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List<Widget>.generate(
                      4,
                      (index) => Expanded(
                          child: _digitField(
                              context: context,
                              textEditingController: _digitsControllers[index],
                              index: index))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _digitField(
      {required BuildContext context,
      required TextEditingController textEditingController,
      required int index}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      width: 52.w,
      height: 53.sp,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Palette.darkBlue),
      child: Center(
        child: TextField(
          focusNode: _focusNodes[index],
          controller: _digitsControllers[index],
          keyboardType: TextInputType.number,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Palette.white, fontSize: 16.sp),
          textAlign: TextAlign.center,
          maxLength: 1,
          onChanged: (a) {
            // setState(() {
            if (a.length == 1) {
              if (index == 3) {
                String number='';
                for(int i=0;i<4;i++){
                  number+=_digitsControllers[i].text;
                }
                 print(number);
                //compare digits code
              } else if (index < 3) {
                _focusNodes[index + 1].requestFocus();
              }
            }
            // });
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelStyle: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Palette.white, fontSize: 18.sp),
            border: InputBorder.none,
          ),
          // onChanged: ,
        ),
      ),
    );
  }
}
