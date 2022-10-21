import 'package:ad_samy/core/resources/core-dimens.dart';
import 'package:ad_samy/core/resources/palette.dart';
import 'package:ad_samy/features/authentiacation/presentation/widgets/spacer-v.dart';
import 'package:ad_samy/features/team-projects/presentation/bloc/team-bloc.dart';
import 'package:ad_samy/features/team-projects/presentation/bloc/team-events.dart';
import 'package:ad_samy/features/team-projects/presentation/bloc/team-states.dart';
import 'package:ad_samy/utils/ext/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

class TaskDetails extends StatefulWidget {
  const TaskDetails({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TaskDetails();
  }
}

class _TaskDetails extends State<TaskDetails> {
  int value = 0;
  bool completed = false;
  _TaskDetails({Key? key}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      body: _buildBody(context: context),
    );
  }

  Widget _buildBody({BuildContext? context}) {
    return BlocBuilder<TeamBloc, TeamStates>(builder: (context, state) {
      if (state is GetTeamTaskDetailsStates) {
        switch (state.teamStatesStatus) {
          case TeamStatesStatus.loading:
            {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          case TeamStatesStatus.failure:
            {
              return Center(
                child: Text(
                  state.errorMessage ?? 'Some thing went wrong',
                  style: Theme.of(context).textTheme.headline1,
                ),
              );
            }
          case TeamStatesStatus.success:
            {
              return _buildDynamicBody(context: context, states: state);
            }
          default:
            {
              return const SizedBox();
            }
        }
      }
      return const SizedBox();
    });
  }

  Widget _buildDynamicBody(
      {BuildContext? context, GetTeamTaskDetailsStates? states}) {
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
                      ? states.teamTaskDetailsEntity!.taskDetailsEntityData!
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
              states!.teamTaskDetailsEntity!.taskDetailsEntityData!
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
                          text: states.teamTaskDetailsEntity!
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
                          text: states.teamTaskDetailsEntity!
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
                        text: states.teamTaskDetailsEntity!
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
                        text: states.teamTaskDetailsEntity!
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
                        text: states.teamTaskDetailsEntity!
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
                    BlocBuilder<TeamBloc, TeamStates>(
                        builder: (context, state) {
                          completed=states.teamTaskDetailsEntity!.taskDetailsEntityData!.taskStatus==2?true:false;
                          return AnimatedToggleSwitch<bool>.dual(
                            current: completed,
                            first: true,
                            second: false,
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
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Center(
                                      child: Container(
                                        width: context.widthInPercent(70.0),
                                        height: context.heightInPercent(20.0),
                                        decoration: BoxDecoration(
                                            color: Palette.white,
                                            borderRadius:
                                            const BorderRadius.all(Radius.circular(25)),
                                            border: Border.all(color: Palette.lightBlack),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black26,
                                                spreadRadius: 1,
                                                blurRadius: 2,
                                                offset: Offset(0, 1.5),
                                              ),
                                            ]),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(16.0),
                                                child: Text(
                                                  completed==false
                                                      ?'Do you finished this task?'
                                                      :'you still Work in This Task',style: Theme.of(context).textTheme.headline1,),
                                              ),
                                            ),
                                            const Spacer(),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: TextButton(
                                                    child:  Center(
                                                      child: Text('yes',style: Theme.of(context).textTheme.bodyText1,),
                                                    ),
                                                    onPressed: () {
                                                      setState((){
                                                        Navigator.pop(context);
                                                        BlocProvider.of<TeamBloc>(context).add(
                                                            UpdateTaskStatusEvent(
                                                              status: completed==false?2:3,
                                                                taskId: states
                                                                    .teamTaskDetailsEntity!
                                                                    .taskDetailsEntityData!
                                                                    .taskId,
                                                                navIndex: 3
                                                            ));
                                                        completed=b;
                                                      });


                                                      // if (state is UpdateTaskStatusStates) {
                                                        //   switch (state.teamStatesStatus) {
                                                        //     case TeamStatesStatus.loading:
                                                        //       {
                                                        //         const Center(
                                                        //           child:
                                                        //           CircularProgressIndicator(),
                                                        //         );
                                                        //       }
                                                        //       break;
                                                        //     case TeamStatesStatus.failure:
                                                        //       {}
                                                        //       break;
                                                        //     case TeamStatesStatus.success:
                                                        //       {
                                                        //        setState((){
                                                        //          Navigator.pop(context);
                                                        //          // context.dismiss();
                                                        //          BlocProvider.of<TeamBloc>(context)
                                                        //              .add(GetTeamTaskDetailsEvent(
                                                        //              navIndex: 3,
                                                        //              taskId: states
                                                        //                  .teamTaskDetailsEntity!
                                                        //                  .taskDetailsEntityData!
                                                        //                  .taskId));
                                                        //          completed = b;
                                                        //        });
                                                        //
                                                        //       }
                                                        //       break;
                                                        //     default:
                                                        //       {}
                                                        //   }
                                                        // }


                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TextButton(
                                                    child:  Center(
                                                      child: Text('no',style: Theme.of(context).textTheme.bodyText1),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },

                            colorBuilder: (b) => b ? Colors.red : Colors.green,
                            iconBuilder: (value) => value
                                ? const Icon(Icons.coronavirus_rounded)
                                : const Icon(Icons.tag_faces_rounded),
                            textBuilder: (value) => value
                                ? const Center(child: Text('in progress'))
                                : const Center(child: Text('completed')),
                          );
                        })
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

  // Widget _toogleProcess(
  //     {BuildContext? context, GetTeamTaskDetailsStates? states}) {
  //
  //   return  BlocBuilder<TeamBloc, TeamStates>(
  //     builder: (context, state) {
  //       completed=states!.teamTaskDetailsEntity!.taskDetailsEntityData!.taskStatus==2?true:false;
  //       return AnimatedToggleSwitch<bool>.dual(
  //     current: completed,
  //     first: true,
  //     second: false,
  //     dif: 50.0,
  //     borderColor: Colors.transparent,
  //     borderWidth: 5.0,
  //     height: 55,
  //     boxShadow: const [
  //       BoxShadow(
  //         color: Colors.black26,
  //         spreadRadius: 1,
  //         blurRadius: 2,
  //         offset: Offset(0, 1.5),
  //       ),
  //     ],
  //     onChanged: (b) {
  //       showDialog(
  //           context: context,
  //           builder: (context) {
  //               return Center(
  //                 child: Container(
  //                   width: context.widthInPercent(70.0),
  //                   height: context.heightInPercent(20.0),
  //                   decoration: BoxDecoration(
  //                       color: Palette.white,
  //                       borderRadius:
  //                           const BorderRadius.all(Radius.circular(25)),
  //                       border: Border.all(color: Palette.lightBlack),
  //                       boxShadow: const [
  //                         BoxShadow(
  //                           color: Colors.black26,
  //                           spreadRadius: 1,
  //                           blurRadius: 2,
  //                           offset: Offset(0, 1.5),
  //                         ),
  //                       ]),
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                        Center(
  //                         child: Padding(
  //                           padding: const EdgeInsets.all(16.0),
  //                           child: Text(
  //                               completed==false
  //                                   ?'Do you finished this task?'
  //                                   :'you still Work in This Task',style: Theme.of(context).textTheme.headline1,),
  //                         ),
  //                       ),
  //                      const Spacer(),
  //                       Row(
  //                         children: [
  //                           Expanded(
  //                             child: TextButton(
  //                               child:  Center(
  //                                 child: Text('yes',style: Theme.of(context).textTheme.bodyText1,),
  //                               ),
  //                               onPressed: () {
  //                                 setState(() {
  //                                   BlocProvider.of<TeamBloc>(context).add(
  //                                       UpdateTaskStatusEvent(
  //                                           taskId: states
  //                                               .teamTaskDetailsEntity!
  //                                               .taskDetailsEntityData!
  //                                               .taskId));
  //                                   if (state is UpdateTaskStatusStates) {
  //                                     switch (state.teamStatesStatus) {
  //                                       case TeamStatesStatus.loading:
  //                                         {
  //                                           const Center(
  //                                             child:
  //                                                 CircularProgressIndicator(),
  //                                           );
  //                                         }
  //                                         break;
  //                                       case TeamStatesStatus.failure:
  //                                         {}
  //                                         break;
  //                                       case TeamStatesStatus.success:
  //                                         {
  //                                           Navigator.pop(context);
  //                                           // context.dismiss();
  //                                           BlocProvider.of<TeamBloc>(context)
  //                                               .add(GetTeamTaskDetailsEvent(
  //                                                   navIndex: 3,
  //                                                   taskId: states
  //                                                       .teamTaskDetailsEntity!
  //                                                       .taskDetailsEntityData!
  //                                                       .taskId));
  //
  //                                           completed = b;
  //                                         }
  //                                         break;
  //                                       default:
  //                                         {}
  //                                     }
  //                                   }
  //                                 });
  //                               },
  //                             ),
  //                           ),
  //                           Expanded(
  //                             child: TextButton(
  //                               child:  Center(
  //                                 child: Text('no',style: Theme.of(context).textTheme.bodyText1),
  //                               ),
  //                               onPressed: () {
  //                                 Navigator.pop(context);
  //                               },
  //                             ),
  //                           )
  //                         ],
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               );
  //             });
  //           },
  //
  //     colorBuilder: (b) => b ? Colors.red : Colors.green,
  //     iconBuilder: (value) => value
  //         ? const Icon(Icons.coronavirus_rounded)
  //         : const Icon(Icons.tag_faces_rounded),
  //     textBuilder: (value) => value
  //         ? const Center(child: Text('in progress'))
  //         : const Center(child: Text('completed')),
  //   );
  // });}
}
