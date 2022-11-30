import 'package:ad_samy/applications/lead-application/services/presentation/pages/lead-home-page.dart';
import 'package:ad_samy/utils/ext/context.dart';
import 'package:ad_samy/utils/ext/forms-format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../applications/lead-application/services/presentation/pages/lead-home-page-controller.dart';
import '../../../../widgets/back-ground-container.dart';
import '../../domain/entities/login-entity.dart';
import '../bloc/auth-bloc.dart';
import '../bloc/auth-states.dart';
import '../resources/dimens.dart';
import '../widgets/auth-customButton.dart';
import '../widgets/back-ground-image.dart';
import '../widgets/page-title.dart';
import '../widgets/spacer-v.dart';
import '../widgets/text-field.dart';
class ForgetPasswordPage extends StatefulWidget {



  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  var emailController=TextEditingController();
  var newPasswordController=TextEditingController();
  var repeatedPasswordController=TextEditingController();
  //
  bool _isSecuredNewPassword=true;
  bool _isSecuredNewPasswordRepeat=true;
  //
  final _forgetPasswordFormKey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,body: _buildBody(),);
  }
  Widget _buildBody() {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
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
                context.goTo(context, LeadHomePageController());
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
      key:_forgetPasswordFormKey ,
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
            keyValue: "newPasswordF",
            hintText: 'New Password',
            fieldType: FieldType.confirmPassword,
            isSecured: _isSecuredNewPassword,
            suffixIcon: _iconButton(FieldType.password),
            keyboardType: TextInputType.visiblePassword,
            fieldController:repeatedPasswordController,
            validator: (val) {
              if (val!.isEmpty) {
                return 'Enter Valid Password';
              }
              return null;
            },
          ),
          SpacerV(
            value: Dimens.space24,
          ),
          AuthTextField(
            keyValue: "confirmNewPasswordF",
            hintText: 'Repeat New Password',
            fieldType: FieldType.confirmPassword,
            isSecured: _isSecuredNewPasswordRepeat,
            suffixIcon: _iconButton(FieldType.confirmPassword),
            keyboardType: TextInputType.visiblePassword,
            fieldController:repeatedPasswordController,
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

        ],
      ),
    );
  }

  _onLoginTaped() {
    if (_forgetPasswordFormKey.currentState!.validate()){
      // BlocProvider.of<AuthBloc>(context).add(
      //     ConfirmPasswordEvent(
      //     loginParams: LoginParams(email: emailController.text,password: passwordController.text))
      // );
    }

  }
  Widget ?_iconButton(FieldType fieldType) {
    if(fieldType==FieldType.password){
      return IconButton(onPressed: (){
        setState(
              () {
            _isSecuredNewPassword = !_isSecuredNewPassword;
          },
        );
      }, icon:Icon(_isSecuredNewPassword ? Icons.visibility_off : Icons.visibility));
    }else if (fieldType==FieldType.confirmPassword){
      return IconButton(onPressed: (){
        setState(
              () {
            _isSecuredNewPasswordRepeat = !_isSecuredNewPasswordRepeat;
          },
        );
      }, icon:Icon(_isSecuredNewPasswordRepeat ? Icons.visibility_off : Icons.visibility),
      );
    }
    return null;


  }


}
