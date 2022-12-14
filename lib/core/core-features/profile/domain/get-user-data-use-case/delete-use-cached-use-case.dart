import 'package:dartz/dartz.dart';
import '../../../../utils/errors.dart';
import '../repository/profile-repository.dart';

class DeleteUserCachedDataUseCase{
 final ProfileRepository profileRepository;

 DeleteUserCachedDataUseCase({required this.profileRepository});

 Future<Either<Failure,bool>>call()async{
   return profileRepository.deleteUserCachedData();
}
}