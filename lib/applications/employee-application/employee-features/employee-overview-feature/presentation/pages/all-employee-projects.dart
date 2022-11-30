import 'package:ad_samy/core/resources/core-dimens.dart';
import 'package:ad_samy/applications/employee-application/employee-features/employee-overview-feature/presentation/bloc/team-events.dart';
import 'package:ad_samy/applications/employee-application/employee-features/employee-overview-feature/presentation/bloc/team-states.dart';
import 'package:ad_samy/utils/ext/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../bloc/team-bloc.dart';
import '../widgets/employee-page-header.dart';
import '../widgets/project-item.dart';

class EmployeeAllProjects extends StatelessWidget {
  const EmployeeAllProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<TeamBloc, TeamStates>(builder: (context, state) {
      if (state is GetTeamAllProjectsStates) {
        switch (state.teamStatesStatus) {
          case TeamStatesStatus.loading:
            {
              return Shimmer.fromColors(
                loop: 10,
                baseColor: Colors.grey,
                highlightColor: Colors.grey[100]!,
                enabled: true,
                child: _buildDynamicBody(context: context),
              );
            }
          case TeamStatesStatus.failure:
            {
              return Center(
                child: Text(
                  state.errorMessage ?? 'some thing went wrong try again later',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              );
            }
          case TeamStatesStatus.success:
            {
              return _buildDynamicBody(context: context, state: state);
            }
          default:
            {
              return const SizedBox();
            }
        }
      }
      return SizedBox(
          child: Center(
        child: Text(
          'some thing went wrong try again later',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ));
    });
  }

  Widget _buildDynamicBody(
      {required BuildContext context, GetTeamAllProjectsStates? state}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const EmployeePageHeader(),
          _catText(context: context, text: 'In Work'),
          _buildInWorkListView(state: state),
          _catText(context: context, text: 'Completed'),
          _buildCompletedListView(context: context, state: state),
        ],
      ),
    );
  }

  Widget _buildInWorkListView({GetTeamAllProjectsStates? state}) {
    return Column(
      children: [
        SizedBox(
          height: 400,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: state != null
                  ? state.teamAllProjectsEntity!.teamAllProjectsEntityData!
                      .InProgressProjectsEntity!.length
                  : 0,
              itemBuilder: (context, index) {
                return InkWell(
                  child: ProjectItem(
                    projectName: state != null
                        ? state
                            .teamAllProjectsEntity!
                            .teamAllProjectsEntityData!
                            .InProgressProjectsEntity![index]
                            .projectTitle
                        : 'crs',
                    taskCount: state != null
                        ? state
                            .teamAllProjectsEntity!
                            .teamAllProjectsEntityData!
                            .InProgressProjectsEntity![index]
                            .tasksCount
                        : 1,
                  ),
                  onTap: () {
                    BlocProvider.of<TeamBloc>(context).projectId = state != null
                        ? state
                                .teamAllProjectsEntity!
                                .teamAllProjectsEntityData!
                                .InProgressProjectsEntity![index]
                                .projectId ??
                            1
                        : 1;
                    BlocProvider.of<TeamBloc>(context).add(
                        GetTeamProjectTasksEvent(
                            projectId: state != null
                                ? state
                                        .teamAllProjectsEntity!
                                        .teamAllProjectsEntityData!
                                        .InProgressProjectsEntity![index]
                                        .projectId ??
                                    1
                                : 1,
                            navIndex: 2,
                            wichCycle: WichCycle.homeCycle));
                  },
                );
              }),
        ),
      ],
    );
  }

  Widget _buildCompletedListView(
      {BuildContext? context, GetTeamAllProjectsStates? state}) {
    if (state != null &&
        state.teamAllProjectsEntity!.teamAllProjectsEntityData!
            .completedProjectsEntity!.isEmpty) {
      return SizedBox(
        height: CoreDimens.h2,
        child: Center(
          child: Text(
            'No Completed Projects Yet. ',
            style: Theme.of(context!).textTheme.headline1,
          ),
        ),
      );
    } else {
      return Column(
        children: [
          SizedBox(
            height: 400,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: state != null
                    ? state.teamAllProjectsEntity!.teamAllProjectsEntityData!
                        .completedProjectsEntity!.length
                    : 0,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: ProjectItem(
                      projectName: state != null
                          ? state
                              .teamAllProjectsEntity!
                              .teamAllProjectsEntityData!
                              .completedProjectsEntity![index]
                              .projectTitle
                          : 'crs',
                      taskCount: state != null
                          ? state
                              .teamAllProjectsEntity!
                              .teamAllProjectsEntityData!
                              .completedProjectsEntity![index]
                              .tasksCount
                          : 0,
                      taskProgress: state != null
                          ? state
                                  .teamAllProjectsEntity!
                                  .teamAllProjectsEntityData!
                                  .completedProjectsEntity![index]
                                  .progressProgress!
                                  .toDouble() /
                              100
                          : .2,
                    ),
                    onTap: () {
                      if (state!
                              .teamAllProjectsEntity!
                              .teamAllProjectsEntityData!
                              .completedProjectsEntity![index]
                              .tasksCount ==
                          0) {
                        context.showMessage(
                            'no tasks assigned for this project yet: ');
                      } else {
                        BlocProvider.of<TeamBloc>(context).projectId =
                            state != null
                                ? state
                                        .teamAllProjectsEntity!
                                        .teamAllProjectsEntityData!
                                        .completedProjectsEntity![index]
                                        .projectId ??
                                    1
                                : 1;
                        BlocProvider.of<TeamBloc>(context).add(
                            GetTeamProjectTasksEvent(
                                projectId: state != null
                                    ? state
                                        .teamAllProjectsEntity!
                                        .teamAllProjectsEntityData!
                                        .completedProjectsEntity![index]
                                        .projectId
                                    : 0,
                                navIndex: 2,
                                wichCycle: WichCycle.homeCycle));
                      }
                    },
                  );
                }),
          ),
        ],
      );
    }
  }

  Widget _catText({required BuildContext context, required String text}) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
