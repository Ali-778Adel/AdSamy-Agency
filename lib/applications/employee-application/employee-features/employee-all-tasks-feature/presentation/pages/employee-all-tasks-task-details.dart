import 'package:ad_samy/applications/employee-application/employee-features/employee-all-tasks-feature/presentation/employee-all-tasks-bloc/bloc.dart';
import 'package:ad_samy/applications/employee-application/employee-features/employee-all-tasks-feature/presentation/employee-all-tasks-bloc/states.dart';
import 'package:ad_samy/utils/ext/context.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/core-features/authentiacation/presentation/widgets/spacer-v.dart';
import '../../../../../../core/resources/core-dimens.dart';
import '../../../../../../core/resources/palette.dart';
import '../employee-all-tasks-bloc/events.dart';

class EmployeeTaskDetails extends StatelessWidget {
  bool completed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      body: _buildBody(context: context),
    );
  }

  Widget _buildBody({BuildContext? context}) {
    return BlocBuilder<EmployeeAllTasksBloc, EmployeeAllTasksStates>(
        builder: (context, state) {
      if (state is GetEmployeeTaskDetailsState) {
        switch (state.processStatus) {
          case ProcessStatus.loading:
            {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          case ProcessStatus.failure:
            {
              return Center(
                child: Text(
                  state.errorMessage ?? 'Some thing went wrong',
                  style: Theme.of(context).textTheme.headline1,
                ),
              );
            }
          case ProcessStatus.success:
            {
              var data = state.employeeTaskDetailsEntity!.taskDetailsEntityData;
              print('task status = ${data!.taskStatus}');
              completed = data.taskStatus == 2 ? true : false;
              return _buildDynamicBody(context: context, states: state);
            }
          default:
            {
              return const SizedBox(
                child: Center(
                  child: Text('no thing to show '),
                ),
              );
            }
        }
      }
      return const SizedBox(
        child: Center(
          child: Text('no thing to show '),
        ),
      );
    });
  }

  Widget _buildDynamicBody(
      {BuildContext? context, GetEmployeeTaskDetailsState? states}) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  states != null
                      ? states.employeeTaskDetailsEntity!.taskDetailsEntityData!
                          .taskTitle!
                      : 'Task Details',
                  style: Theme.of(context!).textTheme.headline1,
                ),
              ),
            ),
            Divider(
              color: Palette.darkLight,
              height: CoreDimens.h4,
            ),
            Text(
              'Description',
              style: Theme.of(context).textTheme.headline1,
            ),
            SpacerV(
              value: CoreDimens.h5,
            ),
            Text(
              states!.employeeTaskDetailsEntity!.taskDetailsEntityData!
                      .taskDescription ??
                  'Task description: ',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Palette.lightBlack),
            ),
            Divider(
              color: Palette.darkLight,
              height: CoreDimens.h4,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Task Check in:  ',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      SpacerV(
                        value: CoreDimens.h4,
                      ),
                      _chickInOutContainer(
                          context: context,
                          text: states.employeeTaskDetailsEntity!
                              .taskDetailsEntityData!.taskDateStart)
                    ],
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Task Date Due: ',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      SpacerV(
                        value: CoreDimens.h4,
                      ),
                      _chickInOutContainer(
                          context: context,
                          text: states.employeeTaskDetailsEntity!
                              .taskDetailsEntityData!.taskDateDue)
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              color: Palette.darkLight,
              height: CoreDimens.h4,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Task Project: ',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SpacerV(
                      value: CoreDimens.h4,
                    ),
                    _chickInOutContainer(
                        context: context,
                        text: states.employeeTaskDetailsEntity!
                            .taskDetailsEntityData!.taskProjectid)
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Task Priority: ',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SpacerV(
                      value: CoreDimens.h4,
                    ),
                    _chickInOutContainer(
                        context: context,
                        text: states.employeeTaskDetailsEntity!
                            .taskDetailsEntityData!.taskPriority)
                  ],
                ),
              ],
            ),
            Divider(
              color: Palette.darkLight,
              height: CoreDimens.h4,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Task Creator: ',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SpacerV(
                      value: CoreDimens.h4,
                    ),
                    _chickInOutContainer(
                        context: context,
                        text: states.employeeTaskDetailsEntity!
                            .taskDetailsEntityData!.taskCreator)
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Task Status:',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SpacerV(
                      value: CoreDimens.h4,
                    ),
                    AnimatedToggleSwitch<bool>.dual(
                      current: completed,
                      first: false,
                      second: true,
                      dif: 50.0,
                      borderColor: Colors.transparent,
                      borderWidth: 5.0,
                      height: 55,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 1.5),
                        ),
                      ],
                      onChanged: (b) {
                        Dialg().call(context: context, states: states);
                      },
                      colorBuilder: (b) => b ? Colors.red : Colors.green,
                      iconBuilder: (val) => val
                          ? const Icon(Icons.coronavirus_rounded)
                          : const Icon(Icons.tag_faces_rounded),
                      textBuilder: (val) => val
                          ? const Center(child: Text('completed'))
                          : const Center(child: Text('in progress')),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  Widget _chickInOutContainer({BuildContext? context, String? text}) {
    return Container(
      width: context!.widthInPercent(35.0),
      height: CoreDimens.h3,
      decoration: BoxDecoration(
          color: Palette.white,
          border: Border.all(color: Palette.darkLight),
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Center(
          child: Text(
        text ?? 'No Data',
        style: Theme.of(context).textTheme.bodyText1,
      )),
    );
  }
}

class Dialg {
  Future call(
      {required BuildContext context,
      required GetEmployeeTaskDetailsState states}) {
    return showDialog(
        context: context,
        builder: (context) {
          return BlocListener<EmployeeAllTasksBloc, EmployeeAllTasksStates>(
            listener: (context, state) {
              if (state is UpdateEmployeeTaskStatusStates) {
                switch (state.processStatus) {
                  case ProcessStatus.loading:
                    {
                      context.show();
                    }
                    break;
                  case ProcessStatus.success:
                    {
                      BlocProvider.of<EmployeeAllTasksBloc>(context).add(
                          GetEmployeeTaskDetailsEvent(
                              taskId: states.employeeTaskDetailsEntity!
                                  .taskDetailsEntityData!.taskId,
                              navIndex: 1));
                    }
                    break;
                  case ProcessStatus.failure:
                    {}
                }
              } else if (state is GetEmployeeTaskDetailsState) {
                if (state.processStatus == ProcessStatus.success) {
                 context.dismiss();
                 context.dismiss();
                } else if (state.processStatus == ProcessStatus.failure) {}
              }
            },
            child: _buildDialogBody(context, states),
          );
        });
  }

  Widget _buildDialogBody(
      BuildContext context, GetEmployeeTaskDetailsState states) {
    return Container(
      color: Palette.white,
      child: Padding(
        padding: EdgeInsets.all(0.sp),
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(16.0.sp),
                child: Text(
                  states.employeeTaskDetailsEntity!.taskDetailsEntityData!
                              .taskStatus ==
                          2
                      ? "You didn't finished this task yet ?"
                      : "Do you finished this task ?",
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                      color: Palette.black, fontWeight: FontWeight.w500),
                )),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Center(
                        child: Text('no'),
                      )),
                ),
                Divider(),
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        BlocProvider.of<EmployeeAllTasksBloc>(context).add(
                            UpdateEmployeeTaskEvent(
                                taskId: states.employeeTaskDetailsEntity!
                                    .taskDetailsEntityData!.taskId,
                                status: states
                                            .employeeTaskDetailsEntity!
                                            .taskDetailsEntityData!
                                            .taskStatus ==
                                        2
                                    ? 3
                                    : 2));
                      },
                      child: Center(
                        child: Text('yes'),
                      )),
                )
              ],
            ),
            SpacerV(
              value: CoreDimens.h1,
            ),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        end: Alignment(0.49999999999999983, 0.9999999999999999),
                        begin: Alignment(0.5, -1.1102230246251565e-16),
                        colors: [
                          const Color(0x00d9d9d9),
                          const Color(0x9e1d5e83),
                        ]),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1.0, 1.1),
                          blurRadius: 1,
                          spreadRadius: 2),
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(-1.0, -1.1),
                          blurRadius: 1,
                          spreadRadius: 2),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                height: MediaQuery.of(context).size.height * .69,
                width: MediaQuery.of(context).size.width * .99,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Task Name : ',
                            style: Theme.of(context).textTheme.bodyText1),
                        TextSpan(
                            text:
                                '${states.employeeTaskDetailsEntity!.taskDetailsEntityData!.taskDescription ?? '---------------'}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: Palette.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14)),
                      ])),
                    ),
                    Expanded(
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Task Chek in : ',
                            style: Theme.of(context).textTheme.bodyText1),
                        TextSpan(
                            text:
                                '${states.employeeTaskDetailsEntity!.taskDetailsEntityData!.taskDateStart ?? '---------------'}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: Palette.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14)),
                      ])),
                    ),
                    Expanded(
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Task Check out : ',
                            style: Theme.of(context).textTheme.bodyText1),
                        TextSpan(
                            text:
                                '${states.employeeTaskDetailsEntity!.taskDetailsEntityData!.taskDateDue ?? '---------------'}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: Palette.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14)),
                      ])),
                    ),
                    Expanded(
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Task Project Name : ',
                            style: Theme.of(context).textTheme.bodyText1),
                        TextSpan(
                            text:
                                '${states.employeeTaskDetailsEntity!.taskDetailsEntityData!.taskProjectid ?? '---------------'}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: Palette.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14)),
                      ])),
                    ),
                    Expanded(
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Task Priority : ',
                            style: Theme.of(context).textTheme.bodyText1),
                        TextSpan(
                            text:
                                '${states.employeeTaskDetailsEntity!.taskDetailsEntityData!.taskPriority ?? '---------------'}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: Palette.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14)),
                      ])),
                    ),
                    Expanded(
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Task Creator : ',
                            style: Theme.of(context).textTheme.bodyText1),
                        TextSpan(
                            text:
                                '${states.employeeTaskDetailsEntity!.taskDetailsEntityData!.taskCreator ?? '---------------'}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: Palette.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14)),
                      ])),
                    ),
                    Expanded(
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Task Status : ',
                            style: Theme.of(context).textTheme.bodyText1),
                        TextSpan(
                            text:
                                '${states.employeeTaskDetailsEntity!.taskDetailsEntityData!.taskStatus ?? '---------------'}' ==
                                        3
                                    ? 'in progress '
                                    : 'completed',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: Palette.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14)),
                      ])),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
