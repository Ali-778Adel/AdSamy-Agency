import 'package:ad_samy/features/services/domain/use_cases/send-lead-form-sue-case.dart';
import 'package:ad_samy/features/services/domain/use_cases/show-service-details-use-case.dart';
import 'package:ad_samy/features/services/presentation/show_services_bloc/bloc_events.dart';
import 'package:ad_samy/features/services/presentation/show_services_bloc/bloc_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/errors.dart';
import '../../../../core/strings/exception_description.dart';
import '../../domain/use_cases/show_services_use_case.dart';

class ShowAllServicesBloc extends Bloc<ShowAllServicesEvents, ServicesStates> {
  final GetAllServicesUseCase getAllServicesUseCase;
  final ShowServiceDetailsUseCase showServiceDetailsUseCase;
  final RegisterLeadFormUseCase registerLeadFormUseCase;
  int currentIndex = 0;
  String?desiredCategoryId;
  final List<int> _backstack = [0];

  ShowAllServicesBloc({
    required this.getAllServicesUseCase,
    required this.showServiceDetailsUseCase,
    required this.registerLeadFormUseCase,
  }) : super(InitState()) {
    on((event, emit) async {
      switch (event.runtimeType) {
        case ShowAllServicesEvent:
          {
            navigateTo(0);
            emit(ShowAllServicesStates(
                showAllServicesStatus: ShowAllServicesStatus.loading));
            final services = await getAllServicesUseCase.call();
            services.fold((l) {
              emit(ShowAllServicesStates(
                  showAllServicesStatus: ShowAllServicesStatus.failure,
                  errorMessage: _getErrorMessage(l)));
            }, (r) {
              emit(ShowAllServicesStates(
                  showAllServicesStatus: ShowAllServicesStatus.success,
                  serviceEntity: r));

            });
          }
          break;
        case ShowServiceDetailsEvent:
          {
            if (event is ShowServiceDetailsEvent) {
              navigateTo(event.index!);
              emit (ShowServiceDetailsStates().copyWith(
                  showAllServicesStatus: ShowAllServicesStatus.loading,
              ));
            final serviceDetails=await  showServiceDetailsUseCase.call(catId: event.catId!);
            serviceDetails.fold
              ((l) {
                emit (ShowServiceDetailsStates().copyWith(
                  showAllServicesStatus: ShowAllServicesStatus.failure,
                  errorMessage: _getErrorMessage(l)
                ));
            },
             (r) {
               emit (ShowServiceDetailsStates().copyWith(
                   showAllServicesStatus: ShowAllServicesStatus.success,
                   serviceDetailsEntity: r
               ));
               desiredCategoryId='${event.catId}';
               print('desiredCatId$desiredCategoryId');

             });

            }
          }
          break;
        case ShowLeadingFormEvent:
          {
            if (event is ShowLeadingFormEvent) {
              navigateTo(event.index!);
              emit(ShowLeadingFormState());
            }
          }
          break;
        case OrderSuccessEvent:
          {
            if (event is OrderSuccessEvent) {
              navigateTo(event.index!);
              emit(OrderSuccessState());
            }
          }
          break;
        case RegisterLeadEvent:{
          if(event is RegisterLeadEvent){
           emit(RegisterLeadFormStates(
             showAllServicesStatus: ShowAllServicesStatus.loading
           ));
           final either=await registerLeadFormUseCase.call(leadFormParams: event.leadFormParams!);
           either.fold(
                   (l) {
                     emit(RegisterLeadFormStates(
                       showAllServicesStatus: ShowAllServicesStatus.failure,
                       errorMessage: _getErrorMessage(l)
                     ));
                   },
                   (r) {
                     emit(RegisterLeadFormStates(
                       showAllServicesStatus: ShowAllServicesStatus.success,
                       categoryId: desiredCategoryId ,
                       registerLeadEntity: r
                     ));
                   });
          }
        }break;
        case PopEvent:
          {
            if (event is PopEvent) {
              customPop(event.context!);
              emit(PopState());
            }
          }break;
      }
    });
  }
  void navigateTo(int index) {
    _backstack.add(index);
    currentIndex = index;
  }

  void navigateBack(int index) {
    currentIndex = index;
    // print('currentIndexis$currentIndex');
  }

  Future<bool> customPop(BuildContext context) {
    if (_backstack.length > 1) {
      _backstack.removeAt(_backstack.length - 1);
      navigateBack(_backstack[_backstack.length - 1]);
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  String _getErrorMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        {
          return SERVER_FAILURE_MESSAGE;
        }
      case OfflineFailure:
        {
          return OFFLINE_FAILURE_MESSAGE;
        }
      default:
        {
          return 'unexpected error ,please try again later .';
        }
    }
  }
}
