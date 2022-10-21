import 'package:ad_samy/features/authentiacation/presentation/pages/reset-password.dart';
import 'package:ad_samy/features/authentiacation/presentation/widgets/auth-customButton.dart';
import 'package:ad_samy/utils/ext/context.dart';
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

class VerifyCode extends StatefulWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  var codeController = TextEditingController();

  final _verifyCodeKey = GlobalKey<FormState>();
  BuildContext? ctx;
  @override
  Widget build(BuildContext context) {
    ctx = context;
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
                  const PageTitle(
                    pageTitle: 'Verify Code',
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
        key: _verifyCodeKey,
        child: Column(children: [
          AuthTextField(
            keyValue: "CodeF",
            hintText: 'Enter the received Code',
            // fieldType: FieldType.mobileNumber,
            keyboardType: TextInputType.number,
            isSecured: false,
            fieldController: codeController,
            validator: (val) {
              if (val!.isEmpty) {
                return "Code mustn't be empty";
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
    if (_verifyCodeKey.currentState!.validate()) {
      ctx!.goTo(ctx!, const ResetPassword());
    }
  }
}
