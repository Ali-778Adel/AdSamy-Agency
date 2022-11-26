// import 'package:ad_samy/features/authentiacation/presentation/widgets/auth-customButton.dart';
// import 'package:ad_samy/utils/ext/context.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../lead-application/services/presentation/pages/lead-home-page-controller.dart';
// import '../../domain/entities/login-entity.dart';
// import '../bloc/auth-bloc.dart';
// import '../bloc/auth-states.dart';
// import '../resources/dimens.dart';
// import '../../../../core/widgets/back-ground-container.dart';
// import '../widgets/back-ground-image.dart';
// import '../widgets/page-title.dart';
// import '../widgets/spacer-v.dart';
// import '../widgets/text-field.dart';
// class ResetPassword extends StatefulWidget{
//   const ResetPassword({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() =>_RestPasswordState();
//
// }
// class _RestPasswordState extends State<ResetPassword> {
//
//   var emailController = TextEditingController();
//   var newPasswordController=TextEditingController();
//   var repeatPasswordController=TextEditingController();
//   //
//   final _resetPasswordFk = GlobalKey<FormState>();
//   //
//   bool _isSecruredPassord=true;
//   bool _isSercurePasswordRepeat=true;
//
//   BuildContext ?ctx;
//   @override
//   Widget build(BuildContext context) {
//     ctx=context;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: _buildBody(),
//     );
//   }
//
//   Widget _buildBody() {
//     return BlocListener<AuthBloc, AuthState>(
//       listener: (context, state) {
//         switch (state.progressStatus) {
//           case ProgressStatus.loading:
//             {
//               context.show();
//             }
//             break;
//           case ProgressStatus.success:
//             {
//               LoginEntity loginEntity = state.progressEntity as LoginEntity;
//               context.dismiss();
//               if (loginEntity.success!) {
//                 context.goTo(context,  LeadHomePageController());
//               } else {
//                 context.showMessage(loginEntity.message!);
//               }
//             }
//             break;
//           case ProgressStatus.failure:
//             {
//               context.dismiss();
//               context.showMessage(state.errorMessage!);
//             }
//             break;
//           default:
//         }
//       },
//       child:  _listenerChild(),
//     );
//   }
//
//   Widget _listenerChild() {
//     return SafeArea(
//         child: Stack(
//           children: [
//             const BackGroundImage(),
//             BackGroundContainer(
//               child: Center(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       SpacerV(
//                         value: Dimens.space50,
//                       ),
//                       const PageTitle(
//                         pageTitle: 'Confirm new Password',
//                       ),
//                       SpacerV(
//                         value: Dimens.space50,
//                       ),
//                       _buildTextFields(),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }
//
//   Widget _buildTextFields() {
//     return Form(
//         key: _resetPasswordFk,
//         child: Column(children: [
//
//           SpacerV(
//             value: Dimens.space24,
//           ),
//           AuthTextField(
//             keyValue: "newPasswordF",
//             hintText: 'New Password',
//             fieldType: FieldType.confirmPassword,
//             isSecured: _isSecruredPassord,
//             suffixIcon: _iconButton(FieldType.password),
//             keyboardType: TextInputType.visiblePassword,
//             fieldController:newPasswordController,
//             validator: (val) {
//               if (val!.isEmpty) {
//                 return 'Enter Valid Password';
//               }
//               return null;
//             },
//           ),
//           SpacerV(
//             value: Dimens.space24,
//           ),
//           AuthTextField(
//             keyValue: "confirmNewPasswordF",
//             hintText: 'Repeat  Password',
//             fieldType: FieldType.confirmPassword,
//             isSecured: _isSercurePasswordRepeat,
//             suffixIcon: _iconButton(FieldType.confirmPassword),
//             keyboardType: TextInputType.visiblePassword,
//             fieldController:repeatPasswordController,
//             validator: (val) {
//               if (val!.isEmpty) {
//                 return 'Enter Valid Password';
//               }
//               return null;
//             },
//           ),
//           SpacerV(value: Dimens.space50,),
//           AuthCustomButton(
//               buttonText: 'Confirm',
//               onTap: () {
//                 _onVerifyTapped();
//               }),
//         ]));
//   }
//
//   _onVerifyTapped() {
//     if(_resetPasswordFk.currentState!.validate()){
//       ctx!.goTo(ctx!, LeadHomePageController());
//     }
//   }
//   Widget ?_iconButton(FieldType fieldType) {
//     if(fieldType==FieldType.password){
//       return IconButton(onPressed: (){
//         setState(
//               () {
//             _isSecruredPassord = !_isSecruredPassord;
//           },
//         );
//       }, icon:Icon(_isSecruredPassord ? Icons.visibility_off : Icons.visibility));
//     }else if (fieldType==FieldType.confirmPassword){
//       return IconButton(onPressed: (){
//         setState(
//               () {
//                 _isSercurePasswordRepeat = !_isSercurePasswordRepeat;
//           },
//         );
//       }, icon:Icon(_isSercurePasswordRepeat ? Icons.visibility_off : Icons.visibility),
//       );
//     }
//     return null;
//
//
//   }
//
// }
