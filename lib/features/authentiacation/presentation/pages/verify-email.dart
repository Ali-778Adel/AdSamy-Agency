
import 'package:ad_samy/features/authentiacation/presentation/pages/verify-code.dart';
import 'package:ad_samy/features/authentiacation/presentation/widgets/auth-customButton.dart';
import 'package:ad_samy/utils/ext/context.dart';
import 'package:ad_samy/utils/ext/forms-format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/presentation/pages/services_page.dart';
import '../../domain/entities/login-entity.dart';
import '../bloc/auth-bloc.dart';
import '../bloc/auth-states.dart';
import '../resources/dimens.dart';
import '../../../../core/widgets/back-ground-container.dart';
import '../widgets/back-ground-image.dart';
import '../widgets/page-title.dart';
import '../widgets/spacer-v.dart';
import '../widgets/text-field.dart';

class VerifyEmail extends StatelessWidget {

  VerifyEmail({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  final _VEFormKey = GlobalKey<FormState>();
   BuildContext ?ctx;
  @override
  Widget build(BuildContext context) {
    ctx=context;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(),
    );
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
              LoginEntity loginEntity = state.progressEntity as LoginEntity;
              context.dismiss();
              if (loginEntity.success!) {
                context.goTo(context,  ServicesMainPage());
              } else {
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
      child:  _listenerChild(),
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
                  const PageTitle(
                    pageTitle: 'Verify Email',
                  ),
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
        key: _VEFormKey,
        child: Column(children: [
          AuthTextField(
            keyValue: "EmailF",
            hintText: 'Enter Your Email',
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
            value: Dimens.space50,
          ),
          AuthCustomButton(
              buttonText: 'Verify',
              onTap: () {
                _onVerifyTapped();
              }),
        ]));
  }

  _onVerifyTapped() {
    if(_VEFormKey.currentState!.validate()){
      ctx!.goTo(ctx!,const VerifyCode());
    }
  }
}
