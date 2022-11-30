import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/utils/errors.dart';
import '../entities/team-overview-entity.dart';
import '../repository/team-repository.dart';

class TeamOverViewUseCase extends Equatable{
  final TeamRepository teamRepository;
 const TeamOverViewUseCase({required this.teamRepository});

 Future<Either<Failure,TeamOverViewEntity>>call({String?teamToken}){
   return teamRepository.getTeamOverView(teamToken: teamToken);
 }

  @override
  List<Object?> get props => [teamRepository];

}