import 'package:ad_samy/features/authentiacation/domain/entities/login-entity.dart';
import 'package:ad_samy/features/authentiacation/presentation/bloc/auth-bloc.dart';
import 'package:ad_samy/features/authentiacation/presentation/pages/register-page.dart';
import 'package:ad_samy/features/authentiacation/presentation/pages/verify-email.dart';
import 'package:ad_samy/features/authentiacation/presentation/widgets/auth-customButton.dart';
import 'package:ad_samy/features/authentiacation/presentation/widgets/auth-toogle-login-register.dart';
import 'package:ad_samy/features/authentiacation/presentation/widgets/back-ground-image.dart';
import 'package:ad_samy/features/services/presentation/pages/services_page.dart';
import 'package:ad_samy/landing-pages/pages/employee-landing-page.dart';
import 'package:ad_samy/utils/ext/context.dart';
import 'package:ad_samy/utils/ext/forms-format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../landing-pages/pages/client-landing-page.dart';
import '../../domain/use-cases/login-use-case.dart';
import '../bloc/auth-events.dart';
import '../bloc/auth-states.dart';
import '../resources/dimens.dart';
import '../../../../core/resources/palette.dart';
import '../../../../core/widgets/back-ground-container.dart';
import '../widgets/page-title.dart';
import '../widgets/spacer-v.dart';
import '../widgets/text-field.dart';

class Login extends StatefulWidget {
  final String?type;
  const Login({Key? key,this.type}) : super(key: key);

  @override
  State<Login> createState() => _LoginState(type: type);
}

class _LoginState extends State<Login> {
  final String?type;
  _LoginState({this. type});
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  //
  bool _isSecuredPassword = true;
  //
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: _buildBody());
  }

  Widget _buildBody() {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state.progressType==ProgressType.login){
          switch (state.progressStatus) {
            case ProgressStatus.loading:
              {
                context.show();
              }
              break;
            case ProgressStatus.success:
              {
                LoginEntity loginEntity=state.progressEntity as LoginEntity;
                context.dismiss();
                if(loginEntity.success!){
                  if(loginEntity.user!.type=='client'){
                    context.goTo(context, const ClientLandingPage());
                  }else if (loginEntity.user!.type=='team'){
                    context.goTo(context, const EmployeeLandingPage());
                  }
                }else{
                  context.showMessage(loginEntity.message!);
                }
              }
              break;
            case ProgressStatus.failure:
              {
                context.dismiss();
                context.showMessage(state.errorMessage!);
              }
              break;
            default:
          }
        }

      },
      child: _listenerChild(),
    );
  }

  Widget _listenerChild() {
    return SafeArea(
        child: Stack(
      children: [
        const BackGroundImage(),
        BackGroundContainer(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SpacerV(
                    value: Dimens.space50,
                  ),
                  const PageTitle(pageTitle: 'Sign in',),
                  SpacerV(
                    value: Dimens.space50,
                  ),
                  _buildTextFields(),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }

  Widget _buildTextFields() {
    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          AuthTextField(
            keyValue: "EmailF",
            hintText: 'Email',
            fieldType: FieldType.email,
            keyboardType: TextInputType.emailAddress,
            isSecured: false,
            fieldController: emailController,
            validator: (val) {
              if (!val!.isValidEmail) {
                return 'Enter Valid Email\n'
                    'example@example.com';
              }
              return null;
            },
          ),
          SpacerV(
            value: Dimens.space24,
          ),
          AuthTextField(
            keyValue: "confirmPasswordF",
            hintText: 'Password',
            fieldType: FieldType.confirmPassword,
            isSecured: _isSecuredPassword,
            suffixIcon: _iconButton(),
            keyboardType: TextInputType.visiblePassword,
            fieldController: passwordController,
            validator: (val) {
              if (val!.isEmpty) {
                return 'Enter Valid Password';
              }
              return null;
            },
          ),
           SpacerV(value:Dimens.space36 ),

          AuthCustomButton(buttonText: 'Login', onTap:(){ _onLoginTaped();}),
           SpacerV(value:Dimens.space16 ,),
           _forgetPasswordOption(),
           // SpacerV(value:Dimens. ,),
           const ToggleLoginRegisterWidget(
              destination: SignUpPage(),
              optionText: "Don't have an account :", buttonText: 'Sign Up')
        ],
      ),
    );
  }

  _onLoginTaped() {
    if (_loginFormKey.currentState!.validate()){
      BlocProvider.of<AuthBloc>(context).add(LoginEvent(
          loginParams: LoginParams(
            type:type!,
              email: emailController.text,
              password: passwordController.text
          )));
    }

  }
  Widget _iconButton() {
    return IconButton(
        onPressed: () {
          setState(() {
            _isSecuredPassword = !_isSecuredPassword;
          });
        },
        icon:
            Icon(_isSecuredPassword ? Icons.visibility_off : Icons.visibility));
  }

  Widget _forgetPasswordOption(){
    return Wrap(
      alignment: WrapAlignment.end,
      crossAxisAlignment: WrapCrossAlignment.center,
    children: [
      TextButton(onPressed: (){
        context.goTo(context,  VerifyEmail());
      }, child: Text('Forget Password ?',style: TextStyle(color: Palette.darkBlue,fontSize: Dimens.subtitle1),))
    ],
    );
  }
}
