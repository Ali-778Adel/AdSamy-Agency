import 'package:ad_samy/features/client-projects/presentation/client-bloc/client-states.dart';
import 'package:ad_samy/features/client-projects/presentation/client-bloc/client-bloc.dart';
import 'package:ad_samy/features/client-projects/presentation/pages/client-projects-main-page.dart';
import 'package:ad_samy/features/client-projects/presentation/widgets/client-page-header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/resources/core-dimens.dart';
import '../../../team-projects/presentation/widgets/employee-page-header.dart';
import '../client-bloc/client-event.dart';
import '../widgets/client-project-item.dart';
class ControlClientProjects extends StatefulWidget{
  const ControlClientProjects({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
  return _ControlClientProjects();
  }

}
class _ControlClientProjects extends State<ControlClientProjects> {
  final List<Widget> _fragments = [
   const ClientAllProjectsPage(key: Key('1'),),
   const ClientsProjectsMainPage(key: Key('2'),),
 ];
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ClientProjectBloc, ClientProjectsStates>(

        builder: (context, state) {
      int currentIndex =
          BlocProvider.of<ClientProjectBloc>(context).currentIndex;
        return WillPopScope(
          onWillPop: () {

              switch (currentIndex) {
                case 1:
                  {
                    BlocProvider.of<ClientProjectBloc>(context)
                        .add(ProjectPopEvent(context: context));
                   return  BlocProvider.of<ClientProjectBloc>(context)
                        .customPop(context)
                        .then((value) {
                      BlocProvider.of<ClientProjectBloc>(context)
                          .add(GetAllClientProjectsEvent(index: 0));
                      return value;
                    });
                  }
                default:
                  {
                    return Future.value(true);
                  }
              }


          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: _fragments[currentIndex],
          ),
        );
    });
  }
}

class ClientAllProjectsPage extends StatelessWidget {
  const ClientAllProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: const Key('clientMainScaffold'),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<ClientProjectBloc, ClientProjectsStates>(
        builder: (context, state) {
      if (state is GetClientAllProjectStates) {
        switch (state.cpsProgressState) {
          case CPSProgressState.loading:
            {
              return _loadingShimmer(state: state);
            }
          case CPSProgressState.failure:
            {
              return Container();
            }
          case CPSProgressState.success:
            {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const ClientPageHeader(),
                    _catText(context: context, text: 'In Work'),
                    _buildInWorkListView(state: state),
                  ],
                ),
              );
            }
          default:
            {
              return Container();
            }
        }
      } else if (state is ClientPopState) {
        BlocProvider.of<ClientProjectBloc>(context)
            .add(ProjectPopEvent(context: context));
      }
      return Container();
    });
  }

  Widget _buildInWorkListView({GetClientAllProjectStates? state}) {
    return Column(
      children: [
        SizedBox(
          height: 400,
          child: ListView.builder(
              itemCount: state!.clientAllProjectsEntity!.data!.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ClientProjectItem(
                  index: index,
                  states: state,
                  projectName: state
                          .clientAllProjectsEntity!.data![index].projectTitle ??
                      'no projects yet',
                );
              }),
        ),
      ],
    );
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

  Widget _loadingShimmer({GetClientAllProjectStates? state}) {
    return Shimmer.fromColors(
        loop: 10,
        baseColor: Colors.grey,
        highlightColor: Colors.grey[100]!,
        enabled: true,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const EmployeePageHeader(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      height: 8,
                      width: CoreDimens.space104,
                      decoration: const BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      height: 8,
                      width: CoreDimens.space50,
                      decoration: const BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ],
              ),
              // _buildInWorkListView(),
            ],
          ),
        ));
  }
}
