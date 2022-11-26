
// ignore_for_file: file_names

import 'package:ad_samy/core/resources/palette.dart';
import 'package:flutter/material.dart';


class VerifyEmail extends StatelessWidget {

 const VerifyEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Palette.white,
   appBar: AppBar(
     backgroundColor: Palette.white,
     centerTitle: true,
     leading: IconButton(icon:const Icon(Icons.chevron_left_outlined,color: Palette.darkBlue,),onPressed: (){Navigator.pop(context);},),
     title: Text('Forget Password!',style: Theme.of(context).textTheme.headline1,),elevation: 0.0,),
    body: _buildBody(context:context),
  );
  }
  Widget _buildBody({required BuildContext context}){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 16.0),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child:Column(

          children: [
            RichText(

                text: TextSpan(
                    style:const TextStyle(height: 2.0),
                    children: [
              TextSpan(
                  text: 'sir:if you client please call our support team to find out your problem ,as due to our crm system this process should complete manually\n'
                  ,style:Theme.of(context).textTheme.bodyText1 ),
              TextSpan(
                children: [
                  TextSpan( text: 'call over this number '
                      ,style:Theme.of(context).textTheme.bodyText1),
                  TextSpan( text: 'or '
                      ,style:Theme.of(context).textTheme.bodyText1!.copyWith(color: Palette.red)),
                  TextSpan( text: 'via whatsapp '
                      ,style:Theme.of(context).textTheme.bodyText1),
                ],
                  ),

              TextSpan(
                  text: '+971554379006'
                  ,style:Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.blue)),
            ]) ),
            const SizedBox(height: 12.0,),
            RichText(

                text: TextSpan(
                    style:const TextStyle(height: 2.0),
                    children: [
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'sir:if you employee please contact  '
                            ,style:Theme.of(context).textTheme.bodyText1
                        ),
                        TextSpan(
                            text: ' CRM system administrator \n'
                            ,style:Theme.of(context).textTheme.bodyText1!.copyWith(color: Palette.red)
                        ),
                        TextSpan(
                            text: 'to fix your problem \n'
                            ,style:Theme.of(context).textTheme.bodyText1
                        ),

                      ],
                ),])
            )],
        )
      ),
    );
  }

  // var emailController = TextEditingController();
  // final _VEFormKey = GlobalKey<FormState>();
  //  BuildContext ?ctx;
  // @override
  // Widget build(BuildContext context) {
  //   ctx=context;
  //   return Scaffold(
  //     resizeToAvoidBottomInset: false,
  //     body: _buildBody(),
  //   );
  // }
  //
  // Widget _buildBody() {
  //   return BlocListener<AuthBloc, AuthState>(
  //     listener: (context, state) {
  //       switch (state.progressStatus) {
  //         case ProgressStatus.loading:
  //           {
  //             context.show();
  //           }
  //           break;
  //         case ProgressStatus.success:
  //           {
  //             LoginEntity loginEntity = state.progressEntity as LoginEntity;
  //             context.dismiss();
  //             if (loginEntity.success!) {
  //               context.goTo(context,  ServicesMainPage());
  //             } else {
  //               context.showMessage(loginEntity.message!);
  //             }
  //           }
  //           break;
  //         case ProgressStatus.failure:
  //           {
  //             context.dismiss();
  //             context.showMessage(state.errorMessage!);
  //           }
  //           break;
  //         default:
  //       }
  //     },
  //     child:  _listenerChild(),
  //   );
  // }
  //
  // Widget _listenerChild() {
  //   return SafeArea(
  //       child: Stack(
  //     children: [
  //       const BackGroundImage(),
  //       BackGroundContainer(
  //         child: Center(
  //           child: SingleChildScrollView(
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 SpacerV(
  //                   value: Dimens.space50,
  //                 ),
  //                 const PageTitle(
  //                   pageTitle: 'Verify Email',
  //                 ),
  //                 SpacerV(
  //                   value: Dimens.space50,
  //                 ),
  //                 _buildTextFields(),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   ));
  // }
  //
  // Widget _buildTextFields() {
  //   return Form(
  //       key: _VEFormKey,
  //       child: Column(children: [
  //         AuthTextField(
  //           keyValue: "EmailF",
  //           hintText: 'Enter Your Email',
  //           fieldType: FieldType.email,
  //           keyboardType: TextInputType.emailAddress,
  //           isSecured: false,
  //           fieldController: emailController,
  //           validator: (val) {
  //             if (!val!.isValidEmail) {
  //               return 'Enter Valid Email\n'
  //                   'example@example.com';
  //             }
  //             return null;
  //           },
  //         ),
  //         SpacerV(
  //           value: Dimens.space50,
  //         ),
  //         AuthCustomButton(
  //             buttonText: 'Verify',
  //             onTap: () {
  //               _onVerifyTapped();
  //             }),
  //       ]));
  // }
  //
  // _onVerifyTapped() {
  //   if(_VEFormKey.currentState!.validate()){
  //     ctx!.goTo(ctx!,const VerifyCode());
  //   }
  // }
}
