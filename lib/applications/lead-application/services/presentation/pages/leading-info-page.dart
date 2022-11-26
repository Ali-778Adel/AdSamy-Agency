import 'package:ad_samy/utils/ext/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/core-features/authentiacation/presentation/widgets/auth-customButton.dart';
import '../../../../../core/resources/palette.dart';
import '../../domain/use_cases/send-lead-form-sue-case.dart';
import '../show_services_bloc/bloc.dart';
import '../show_services_bloc/bloc_events.dart';
import '../show_services_bloc/bloc_states.dart';
import '../widgets/page-title.dart';
import '../widgets/text-field.dart';

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
      resizeToAvoidBottomInset: true,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocListener<ShowAllServicesBloc, ServicesStates>(
        listener: (context, state) {
          if (state is RegisterLeadFormStates) {
            switch (state.showAllServicesStatus) {
              case ShowAllServicesStatus.loading:
                {
                  context.show();
                }
                break;
              case ShowAllServicesStatus.success:
                {
                  context.dismiss();
                  if (state.registerLeadEntity!.status!) {
                    BlocProvider.of<ShowAllServicesBloc>(context)
                        .add(OrderSuccessEvent(index: 3));
                  } else {
                    context.showMessage(state.registerLeadEntity!.message!);
                  }
                }
                break;
              case ShowAllServicesStatus.failure:
                {
                  context.dismiss();
                  // context.showMessage(state.);
                }
                break;
              default:
            }
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
        )));
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
                Center(child: BlocBuilder<ShowAllServicesBloc, ServicesStates>(
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
          BlocProvider.of<ShowAllServicesBloc>(context).add(RegisterLeadEvent(
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
