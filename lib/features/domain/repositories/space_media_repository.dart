import 'package:dartz/dartz.dart';
import 'package:projeto_clean/core/failures/server_failures.dart';
import 'package:projeto_clean/features/domain/entities/space_media_entity.dart';

abstract class ISpaceMediaRepository {
  Future<Either<ServerFailure, SpaceMediaEntity>> getSpaceMediaFromDate(
      DateTime dateTime);
}
