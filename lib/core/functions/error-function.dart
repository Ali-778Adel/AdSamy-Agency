import '../utils/errors.dart';
import '../strings/exception_description.dart';

class Errors{

  static String getErrorMessage(Failure failure) {
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