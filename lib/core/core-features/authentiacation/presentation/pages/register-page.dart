// // ignore_for_file: file_names
//
// import 'package:ad_samy/features/authentiacation/domain/entities/sign-up-entity.dart';
// import 'package:ad_samy/features/authentiacation/presentation/pages/login.dart';
// import 'package:ad_samy/features/authentiacation/presentation/resources/dimens.dart';
// import 'package:ad_samy/features/authentiacation/presentation/widgets/auth-toogle-login-register.dart';
// import 'package:ad_samy/utils/ext/context.dart';
// import 'package:ad_samy/utils/ext/forms-format.dart';
// import 'package:ad_samy/features/authentiacation/domain/use-cases/sign-up%20use-case.dart';
// import 'package:ad_samy/features/authentiacation/presentation/bloc/auth-bloc.dart';
// import 'package:ad_samy/features/authentiacation/presentation/bloc/auth-events.dart';
// import 'package:ad_samy/features/authentiacation/presentation/bloc/auth-states.dart';
// import 'package:ad_samy/features/authentiacation/presentation/widgets/auth-customButton.dart';
// import 'package:ad_samy/core/widgets/back-ground-container.dart';
// import 'package:ad_samy/features/authentiacation/presentation/widgets/back-ground-image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../lead-application/services/presentation/pages/lead-home-page-controller.dart';
// import '../bloc/auth-states.dart';
// import '../widgets/page-title.dart';
// import '../widgets/spacer-v.dart';
// import '../widgets/text-field.dart';
// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});
//
//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }
//
// class _SignUpPageState extends State<SignUpPage> {
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final phoneController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//
//   bool _isSecuredPassword = true;
//   bool _isSecuredRepeatedPassword = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: _buildBody(),
//     );
//   }
//   Widget _buildBody() {
//     return BlocListener<AuthBloc, AuthState>(
//         listener: (context, state) {
//           switch (state.progressStatus) {
//             case ProgressStatus.loading:
//               {
//                 context.show();
//               }
//               break;
//             case ProgressStatus.success:
//               SignUpEntity? signUpEntity =
//                   state.progressEntity as SignUpEntity?;
//               if (!signUpEntity!.status!) {
//                 context.dismiss();
//                 context.showMessage(signUpEntity.message!);
//               } else {
//                 Navigator.pop(context);
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) =>  LeadHomePageController()));
//               }
//               break;
//             case ProgressStatus.failure:
//               context.dismiss();
//               context.showMessage(state.errorMessage!);
//               break;
//             default:
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) =>  LeadHomePageController()));
//           }
//         },
//         child: SafeArea(
//           child: Stack(
//             children: [
//               const BackGroundImage(),
//               BackGroundContainer(
//                 child: Center(
//                   child: SingleChildScrollView(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SpacerV(
//                           value: Dimens.space50,
//                         ),
//                         const PageTitle(pageTitle: 'Sign Up',),
//                         SpacerV(
//                           value: Dimens.space36,
//                         ),
//                         _buildTextFields(),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
//
//   Widget _buildTextFields() {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           AuthTextField(
//             keyValue: "NameF",
//             hintText: 'Full Name',
//             fieldType: FieldType.name,
//             fieldController: nameController,
//             keyboardType: TextInputType.name,
//             validator: (val) {
//               if (!val!.isValidName) {
//                 return 'Enter Valid Name\n'
//                     'Name must only contain letters  like Ahmed Mohamed ';
//               }
//               return null;
//             },
//             inputFormatters: [
//               FilteringTextInputFormatter.allow(
//                 RegExp(r"[a-zA-Z]+|\s"),
//               )
//             ],
//           ),
//           AuthTextField(
//             keyValue: "EmailF",
//             hintText: 'Email',
//             fieldType: FieldType.email,
//             keyboardType: TextInputType.emailAddress,
//             fieldController: emailController,
//             validator: (val) {
//               if (!val!.isValidEmail) {
//                 return 'Enter Valid Email\n'
//                     'example@example.com';
//               }
//               return null;
//             },
//           ),
//           AuthTextField(
//             keyValue: "MobileF",
//             hintText: 'Mobile Number',
//             fieldType: FieldType.mobileNumber,
//             keyboardType: TextInputType.phone,
//             fieldController: phoneController,
//             validator: (val) {
//               if (!val!.isValidPhone) {
//                 return 'Enter Valid Mobile Number\n'
//                     '+201010101010';
//               }
//               return null;
//             },
//             inputFormatters: [
//               FilteringTextInputFormatter.allow(
//                 RegExp(r"[0-9]"),
//               )
//             ],
//           ),
//           AuthTextField(
//             keyValue: "passwordF",
//             hintText: 'Password',
//             isSecured: _isSecuredPassword,
//             suffixIcon: _iconButton( FieldType.password),
//             fieldType: FieldType.password,
//             keyboardType: TextInputType.visiblePassword,
//             fieldController: passwordController,
//             validator: (val) {
//               if (val!.isEmpty) return 'Enter Valid Password';
//               return null;
//             },
//           ),
//           AuthTextField(
//             keyValue: "confirmPasswordF",
//             hintText: 'Repeat Password',
//             fieldType: FieldType.confirmPassword,
//             isSecured: _isSecuredRepeatedPassword,
//             suffixIcon: _iconButton( FieldType.confirmPassword),
//             keyboardType: TextInputType.visiblePassword,
//             fieldController: confirmPasswordController,
//             validator: (val) {
//               if (!_isPasswordIdentical) return 'confirmation is not identical';
//               return null;
//             },
//           ),
//           SpacerV(
//             value: Dimens.space36,
//           ),
//           BlocBuilder<AuthBloc, AuthState>(
//             builder: (context, state) {
//               return AuthCustomButton(
//                 buttonText: 'Sign Up',
//                 onTap: () {
//                   _onRegister(context);
//                 },
//               );
//             },
//           ),
//           SpacerV(
//             value: Dimens.space16,
//           ),
//           const  ToggleLoginRegisterWidget(
//               destination: Login(),
//               optionText: 'Already have an account',
//               buttonText: 'Login'),
//           SpacerV(
//             value: Dimens.space24,
//           ),
//
//         ],
//       ),
//     );
//   }
//
//   _onRegister(BuildContext context) {
//     if (_formKey.currentState!.validate() && _isPasswordIdentical) {
//       BlocProvider.of<AuthBloc>(context).add(SignUpEvent(
//           signUpParams: SignUpParams(
//               name: nameController.text,
//               email: emailController.text,
//               phoneNumber: phoneController.text,
//               password: passwordController.text)));
//     }
//   }
//
//   bool get _isPasswordIdentical {
//     if (passwordController.text == confirmPasswordController.text) {
//       return true;
//     } else {
//       return false;
//     }
//   }
//
//   Widget ?_iconButton(FieldType fieldType) {
//     if(fieldType==FieldType.password){
//       return IconButton(onPressed: (){
//         setState(
//               () {
//             _isSecuredPassword = !_isSecuredPassword;
//           },
//         );
//       }, icon:Icon(_isSecuredPassword ? Icons.visibility_off : Icons.visibility));
//     }else if (fieldType==FieldType.confirmPassword){
//       return IconButton(onPressed: (){
//         setState(
//               () {
//             _isSecuredRepeatedPassword = !_isSecuredRepeatedPassword;
//           },
//         );
//       }, icon:Icon(_isSecuredRepeatedPassword ? Icons.visibility_off : Icons.visibility),
//       );
//     }
//     return null;
//
//
//   }
// }
