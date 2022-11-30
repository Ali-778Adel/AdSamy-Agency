import 'package:ad_samy/applications/lead-application/services/presentation/lead-blocs/lead-form-bloc/lead-form-bloc.dart';
import 'package:ad_samy/applications/lead-application/services/presentation/lead-blocs/lead-form-bloc/lead-form-events.dart';
import 'package:ad_samy/applications/lead-application/services/presentation/lead-blocs/lead-form-bloc/lead-form-states.dart';
import 'package:ad_samy/utils/ext/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/core-features/authentiacation/presentation/widgets/auth-customButton.dart';
import '../../../../../core/resources/palette.dart';
import '../../domain/use_cases/send-lead-form-sue-case.dart';
import '../lead-blocs/lead-home-page-bloc/bloc.dart';
import '../lead-blocs/lead-home-page-bloc/bloc_events.dart';
import '../widgets/lead-app-bar.dart';
import '../widgets/page-title.dart';
import '../widgets/text-field.dart';
import 'package:ad_samy/di/dependency_injection_container.dart' as da;

class LeadingInfoPage extends StatelessWidget {
  LeadingInfoPage({Key? key}) : super(key: key);
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final descriptionController = TextEditingController();
  final valueController = TextEditingController();

  final _leadFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LeadAppBar().call(context: context),
      resizeToAvoidBottomInset: true,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocProvider(create: (context)=>da.sl<LeadFormBloc>(),
      child:   BlocListener<LeadFormBloc, LeadFormStates>(
          listener: (context, state) {
              switch (state.leadFormProgressStatus) {
                case LeadFormProgressStatus.loading:
                  {
                    context.show();
                  }
                  break;
                case LeadFormProgressStatus.success:
                  {
                    context.dismiss();
                    if (state.registerLeadEntity!.status!) {
                      context.pushNamed(context,
                          'order_success');
                    } else {
                      context.showMessage(state.registerLeadEntity!.message!);
                    }
                  }
                  break;
                case LeadFormProgressStatus.failure:
                  {
                    context.dismiss();
                  }
                  break;
                default:
              }

          },
          child: SafeArea(
              child: Stack(
                children: [
                  Positioned(
                      top: 20.sp,
                      height: 40.sp,
                      left: 0.0,
                      right: 0.0,
                      child: PageTitle(title: ' AdSamy Marketing Agency.')),
                  Positioned(
                      top: 50.h,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Palette.white.withOpacity(.70),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(35),
                                topRight: Radius.circular(35))),
                        child: Padding(
                          padding: EdgeInsets.all(10.w),
                          child: _infoForm(context),
                        ),
                      ))
                ],
              ))),

    );




  }

  Widget _infoForm(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _leadFormKey,
        child: Container(
          height: MediaQuery.of(context).size.height * .70,
          padding: const EdgeInsets.all(20),
          child: Column(
              key: const Key('serviceDetailsColumn'),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  widthFactor: MediaQuery.of(context).size.width,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ' Enter Your Information  ',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                InfoTextField(
                  fieldController: firstNameController,
                  hintText: 'First Name',
                  validator: (String? val) {},
                  keyValue: 'firstNameField',
                  keyboardType: TextInputType.name,
                ),
                InfoTextField(
                  fieldController: lastNameController,
                  hintText: 'Last Name',
                  validator: (String? val) {},
                  keyValue: 'firstNameField',
                  keyboardType: TextInputType.name,
                ),
                InfoTextField(
                  fieldController: phoneController,
                  hintText: 'Phone Number',
                  validator: (String? val) {},
                  keyValue: 'firstNameField',
                  keyboardType: TextInputType.name,
                ),
                InfoTextField(
                  fieldController: emailController,
                  hintText: 'E-Mail',
                  validator: (String? val) {},
                  keyValue: 'firstNameField',
                  keyboardType: TextInputType.emailAddress,
                ),
                InfoTextField(
                  fieldController: descriptionController,
                  hintText: 'Description',
                  validator: (String? val) {},
                  keyValue: 'firstNameField',
                  keyboardType: TextInputType.name,
                ),
                InfoTextField(
                  fieldController: valueController,
                  hintText: 'Value',
                  validator: (String? val) {},
                  keyValue: 'phoneNumberField',
                  keyboardType: TextInputType.number,
                ),
                Spacer(
                    // value: ServicesDimens.space24,
                    ),
                Center(child: BlocBuilder<LeadFormBloc, LeadFormStates>(
                    builder: (context, state) {
                  return _leadRegisterButton(context);
                }))
              ]),
        ),
      ),
    );
  }

  Widget _leadRegisterButton(BuildContext context) {
    return AuthCustomButton(
      buttonText: 'Confirm',
      onTap: () {
        if (_leadFormKey.currentState!.validate()) {
          print(firstNameController.text);
          BlocProvider.of<LeadFormBloc>(context).add(LeadFormEvents(
              leadFormParams: LeadFormParams(
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            email: emailController.text,
            phone: phoneController.text,
            companyName: descriptionController.text,
            value: valueController.text,
            description: descriptionController.text,
            leadCategoryId: BlocProvider.of<ShowAllServicesBloc>(context)
                    .desiredCategoryId ??
                '4',
          )));
        }
      },
    );
  }
}

enum InfoFieldType { firstName, secondName, phone, email, value }
