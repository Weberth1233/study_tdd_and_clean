import 'package:dartz/dartz.dart';
import 'package:projeto_clean/core/failures/server_failures.dart';
import 'package:projeto_clean/core/usecase/usecase.dart';
import 'package:projeto_clean/features/domain/entities/space_media_entity.dart';

import '../repositories/space_media_repository.dart';

class GetSpaceMediaFromDateUsecase
    implements UseCase<SpaceMediaEntity, DateTime> {
  final ISpaceMediaRepository repository;

  GetSpaceMediaFromDateUsecase({required this.repository});

  @override
  Future<Either<ServerFailure, SpaceMediaEntity>> call(DateTime date) async {
    //UseCase serve também para fazer validações - verificar valores passando por parametros estão corretos
    //Regra de negocio -  Validações que tem haver com a regra de negocio são feitas aqui
    return await repository.getSpaceMediaFromDate(date);
  }
}
