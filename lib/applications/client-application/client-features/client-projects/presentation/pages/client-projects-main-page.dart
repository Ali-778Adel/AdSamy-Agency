// ignore_for_file: file_names
import 'package:ad_samy/utils/ext/context.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../core/core-features/authentiacation/presentation/widgets/spacer-v.dart';
import '../../../../../../core/resources/core-dimens.dart';
import '../../../../../../core/resources/palette.dart';

import '../../domain/entities/project-entity.dart';
import '../client-bloc/client-bloc.dart';
import '../client-bloc/client-event.dart';
import '../client-bloc/client-states.dart';
import '../widgets/page-title.dart';
import '../widgets/progress-indicator.dart';

class Demo extends StatelessWidget{
   final String text;
   const Demo({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child:  SizedBox(
              height: CoreDimens.cardH5,
              width: double.infinity,
              child: Image.asset('assets/noresult.jpg',fit: BoxFit.fill,),
            ),
          ),
          Expanded(child: Container(
            padding: const EdgeInsets.all(24.0),
              child: Text(text,style: Theme.of(context).textTheme.bodyText1,)))
        ],
        ),),
    );
  }}

class ClientsProjectsMainPage extends StatefulWidget{
  const ClientsProjectsMainPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ClientsProjectsMainPage();
  }

}

class _ClientsProjectsMainPage extends State<ClientsProjectsMainPage> {
  TabController? tabController;
  int tabBarIndex = 0;
  List<Widget> tabBarPages = [
    const ProjectPage(),
    const Demo(text: 'No Additional Details'),
    const Demo(text: 'No Tasks Assigned To This Project'),
    const Demo(text: 'No payment yet'),
  ];

  @override
  Widget build(BuildContext context) {
        return StreamBuilder<ClientProjectBloc>(
          builder: (context, snapshot) {
            return Scaffold(
              backgroundColor: Colors.white12,
              restorationId: "ClientProject",
              body: _buildBody(),
            );
          }
        );

  }

  Widget _buildBody() {
    return DefaultTabController(
        length: tabBarPages.length,
        initialIndex: tabBarIndex,
        child: SafeArea(
          child: Column(
            children: [
              _buildTitle(),
              Expanded(
                child: ClayContainer(
                    height: 2000, child: TabBarView(children: tabBarPages)),
              )
            ],
          ),
        ));
  }

  Widget _skeletonText() {
    return Shimmer.fromColors(
        loop: 10,
        baseColor: Colors.grey,
        highlightColor: Colors.grey[100]!,
        enabled: true,
        child: Column(
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
        ));
  }

  Widget _buildTitle() {
    return BlocBuilder<ClientProjectBloc, ClientProjectsStates>(
        builder: (context, state) {
      if (state is GetClientProjectStates) {
        switch(state.cpsProgressState){
          case CPSProgressState.loading:{
            return _skeletonText();
          }
          case CPSProgressState.failure:{
            return  AlertDialog(content: Center(child: Text(state.errorMessage??'some thing went wrong ,try again later'),),);
          }
          case CPSProgressState.success:{
            return  ClientsPageTitle(
              title: state.clientProjectEntity!.data!.projectTitle ??
                  'Traffic System',
              tabController: tabController,
              function: (index) {
                setState(() {
                  tabBarIndex = index!;
                });
              },
            );
          }
          default:{
            return Container();
          }
        }
      }else if(state is ClientPopState){
       BlocProvider.of<ClientProjectBloc>(context).add(ProjectPopEvent(context: context));
      }
      return Container();
    });
  }
}

class ProjectPage extends StatelessWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        _buildClayContainer(context),
      ],
    );
  }

  Widget _buildClayContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<ClientProjectBloc, ClientProjectsStates>(
          builder: (context, state) {

        if (state is GetClientProjectStates) {
          switch(state.cpsProgressState){
            case CPSProgressState.loading:{
              return ClayContainer(
                width: double.infinity,
                color: Colors.white,
                spread: 12,
                depth: 20,
                borderRadius: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const  CustomProgressIndicator(
                        progressValue:0.0
                    ),
                    _divider(),
                    _clientInfo(
                        context: context,
                        clientName:'ali'

                    ),
                    _divider(),
                    _projectInfo(
                      context: context,
                    ),
                    _divider(),
                    _dealInfo(
                      context: context,

                    ),
                    _divider(),
                    _generalDealInfo(
                      context: context,

                    ),
                  ],
                ),
              );
            }
            case CPSProgressState.failure:{
              return Center(
                child: Text('${state.errorMessage}'),
              );
            }
            case CPSProgressState.success:{
              final data = state.clientProjectEntity!.data!;
              return ClayContainer(
                width: double.infinity,
                color: Colors.white,
                spread: 12,
                depth: 20,
                borderRadius: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomProgressIndicator(
                      progressValue:state.clientProjectEntity!.data!.projectProgress!.toDouble()/100,

                    ),
                    _divider(),
                    _clientInfo(
                        map: state.clientProjectEntity!.data!.projectAssigned,
                        context: context,
                        clientName: state.clientProjectEntity!.data!.projectClient!,
                        projectMange: '${state.clientProjectEntity!.data!.projectCreatorFirstName} ${state.clientProjectEntity!.data!.projectCreatorLastName}',
                        tag: 'no Tags'),
                    _divider(),
                    _projectInfo(
                        context: context,
                        startDate: data.projectDateStart,
                        category: data.projectStatus,
                        dueTo: data.projectDateDue,
                        projectStatus: data.projectStatus),
                    _divider(),
                    _dealInfo(
                        context: context,
                        billingType: data.projectBillingType,
                        estimatedHours:'${ data.projectBillingEstimatedHours}',
                        rate: data.projectBillingRate,
                        timeSpent: data.projectTimeSpent!.timeSpent),
                    _divider(),
                    _generalDealInfo(
                        context: context,
                        allInvoicesVal: '${data.projectInvoices!.totalInvoices}',
                        paymentVal: '${data.projectPayments!.payments}',
                        balanceVal: '${(data.projectInvoices!.totalInvoices)!-(data.projectPayments!.payments!)}'

                    ),
                  ],
                ),
              );
            }
            default:{
              return const SizedBox();
            }

          }
        }
        return const SizedBox();
      }),
    );
  }

  Widget _clientInfo({required BuildContext context, List<ProjectAssigned>? map, required String clientName, String? projectMange, String? tag}) {return SizedBox(
      height: CoreDimens.cardH5,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: _isLoading(
                  Text(
                    clientName,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                )),
            const SpacerV(),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: CircleAvatar(
                radius: 25,
              ),
            ),
            const SpacerV(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 2,
                    child: _listTileDesign(
                        context: context,
                        isMenu: true,
                        map: map,
                        titleText: 'Assigned',
                        )),
                Expanded(
                    flex: 3,
                    child: _listTileDesign(
                        context: context,
                        isMenu: false,
                        titleText: 'Project Manger',
                        subTitleText: projectMange)),
                Expanded(
                    flex: 2,
                    child: _listTileDesign(
                        context: context,
                        isMenu: false,
                        titleText: 'Tags',
                        subTitleText: tag)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _projectInfo({required BuildContext context, String? startDate, String? category, String? dueTo, String? projectStatus}) {
    return SizedBox(
      height: CoreDimens.cardH1,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: _customListTile(
                  context: context,
                  status: false,
                  leadingMainText: 'Start Date',
                  leadingSubText: startDate,
                  trailingMainText: 'Due To',
                  trailingSubText: dueTo)),
          Expanded(
              flex: 1,
              child: _customListTile(
                  context: context,
                  status: true,
                  leadingMainText: 'Category',
                  leadingSubText: category,
                  trailingMainText: 'Project Status',
                  trailingSubText: projectStatus)),
        ],
      ),
    );
  }

  Widget _dealInfo({required BuildContext context, String? billingType, String? estimatedHours, String? rate, String? timeSpent,}) {
    return SizedBox(
      height: CoreDimens.cardH1,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: _customListTile(
                  context: context,
                  status: false,
                  leadingMainText: 'Billing Type',
                  leadingSubText: billingType,
                  trailingMainText: 'Rate',
                  trailingSubText: rate)),
          Expanded(
              flex: 1,
              child: _customListTile(
                  context: context,
                  status: false,
                  leadingMainText: 'Estimated Hours',
                  leadingSubText: estimatedHours,
                  trailingMainText: 'Time Spent',
                  trailingSubText: timeSpent)),
        ],
      ),
    );
  }

  Widget _generalDealInfo({required BuildContext context, String? allInvoicesVal, String? paymentVal, String? balanceVal}) {
    return Column(
      children: [
        _horizontalListTile(
            context: context,
            leadText: 'All Invoices',
            trailingText: allInvoicesVal),
        _horizontalListTile(
            context: context, leadText: 'Payment', trailingText: paymentVal),
        _horizontalListTile(
            context: context,
            leadText: 'Balance Due ',
            trailingText: balanceVal)
      ],
    );
  }

  Widget _listTileDesign({required BuildContext context, required bool isMenu, List<ProjectAssigned>? map, String? titleText, String? subTitleText}) {
    return ListTile(
        title: Text(
          '$titleText\n',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        subtitle: _isLoading(
          isMenu
              ? _showButton(context:context,assigned: map??[
                ProjectAssigned(firstName: 'no assigned employee',)
          ])
              : Text(
                  subTitleText ?? "----------",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Palette.lightBlack),
                ),
        ));
  }

  Widget _horizontalListTile({required BuildContext context, required String leadText, String? trailingText}) {
    return ListTile(
      leading: Text(
        leadText,
        style: Theme.of(context)
            .textTheme
            .headline1!
            .copyWith(fontWeight: FontWeight.w500),
      ),
      trailing: _isLoading(
        Text(
          trailingText ?? '00.0',
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Palette.lightBlack, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _customListTile({required BuildContext context, required bool status, required String leadingMainText, String? leadingSubText, required String trailingMainText, String? trailingSubText, String? projectStatus}) {
    return ListTile(
      leading: SizedBox(
        width: context.widthInPercent(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Text(
              leadingMainText,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontWeight: FontWeight.w500),
            )),
            const SpacerV(),
            Expanded(
                child: _isLoading(
              Text(
                leadingSubText ?? '--------',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            )),
          ],
        ),
      ),
      trailing: SizedBox(
        width: context.widthInPercent(50),
        // height: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
                child: Text(
              trailingMainText,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontWeight: FontWeight.w500),
            )),
            const SpacerV(),
            status
                ? Expanded(
                    child: Container(
                      height: CoreDimens.h4,
                      width: CoreDimens.space96,
                      decoration: BoxDecoration(
                        border: Border.all(color: Palette.darkLight),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: Text(
                          projectStatus ?? 'Not Started',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: _isLoading(
                    Text(
                      trailingSubText ?? '--------',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  )),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.only(left: 8, right: 20, bottom: 5),
      child: Divider(
        color: Palette.darkLight,
        thickness: 1,
      ),
    );
  }

  Widget _skeletonText() {
    return Shimmer.fromColors(
        loop: 10,
        baseColor: Colors.grey,
        highlightColor: Colors.grey[100]!,
        enabled: true,
        child: Column(
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
        ));
  }

  Widget _isLoading(Widget widget) {
    return BlocBuilder<ClientProjectBloc, ClientProjectsStates>(
        builder: (context, state) {
      if (state is GetClientProjectStates) {
        if (state.cpsProgressState == CPSProgressState.loading) {
          return _skeletonText();
        } else if (state.cpsProgressState == CPSProgressState.success) {
          return widget;
        }
      }
      return Container();
    });
  }

  Widget _showButton({required BuildContext context, required List<ProjectAssigned> assigned}) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor:Palette.white,
            shadowColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            side:const BorderSide(color: Palette.darkBlue),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              context: context,
              builder: (context) {
                return ClayContainer(
                  color: Palette.white,
                  depth: 20,
                  spread: 0,
                  borderRadius: 25,
                  child: Column(
                    children: [
                      Padding(
                        padding:const  EdgeInsets.all(16.0),
                        child: Center(child:Text('Project Assigned',style:Theme.of(context).textTheme.headline1,),),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount:assigned.length ,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: ClayContainer(
                                  color: Palette.white,
                                  depth: 30,
                                  spread: 2,
                                  borderRadius: 15,
                                  height: CoreDimens.cardH2,
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text: 'name: ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(color: Palette.lightBlack)),
                                        TextSpan(
                                            text:
                                                '${assigned[index].firstName} ${assigned[index].lastname}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                      ])),
                                       SpacerV(value: CoreDimens.body2,),
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text: 'email: ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(color: Palette.lightBlack)),
                                        TextSpan(
                                            text: '${assigned[index].email}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                      ])),
                                      SpacerV(value: CoreDimens.body2,),
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text: 'position: ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(color: Palette.lightBlack)),
                                        TextSpan(
                                            text: '${assigned[index].position}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                      ])),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                );
              });
        },
        child: Text(
          'show team',
          style: Theme.of(context).textTheme.bodyText1,
        ));
  }
}

