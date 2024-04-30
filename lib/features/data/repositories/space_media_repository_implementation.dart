import 'package:dartz/dartz.dart';
import 'package:projeto_clean/core/failures/server_failures.dart';
import 'package:projeto_clean/features/domain/entities/space_media_entity.dart';
import 'package:projeto_clean/features/domain/repositories/space_media_repository.dart';

import '../datasources/space_media_data_source.dart';

class SpaceMediaRepositoryImplementation implements ISpaceMediaRepository {
  final ISpaceMediaDatasource dataSource;

  SpaceMediaRepositoryImplementation({required this.dataSource});

  @override
  Future<Either<ServerFailure, SpaceMediaEntity>> getSpaceMediaFromDate(
      DateTime dateTime) async {
    try {
      final result = await dataSource.getSpaceMediaFromDate(dateTime);
      return Right(result);
    } catch (e) {
      return Left(Failure());
    }
  }
}
