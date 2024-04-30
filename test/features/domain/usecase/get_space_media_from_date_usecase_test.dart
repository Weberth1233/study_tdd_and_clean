import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:projeto_clean/core/failures/server_failures.dart';
import 'package:projeto_clean/core/usecase/usecase.dart';
import 'package:projeto_clean/features/domain/entities/space_media_entity.dart';
import 'package:projeto_clean/features/domain/repositories/space_media_repository.dart';
import 'package:projeto_clean/features/domain/usecases/get_space_media_usecase.dart';

class MockSpaceMediaRepository extends Mock implements ISpaceMediaRepository {}

void main() {
  late GetSpaceMediaFromDateUsecase usecase;
  late ISpaceMediaRepository repository;

  setUp(() {
    repository = MockSpaceMediaRepository();
    usecase = GetSpaceMediaFromDateUsecase(repository: repository);
  });

  const tSpaceMedia = SpaceMediaEntity(
      description:
          'Meteors can be colorful. While the human eye usually cannot discern many colors, cameras often can.',
      mediaType: 'image',
      title: 'A Colorful Quadrantid Meteor',
      mediaUrl:
          'https://apod.nasa.gov/apod/image/2102/MeteorStreak_Kuszaj_1080.jpg');

  final tDate = DateTime(2021, 02, 02);
  //Escrevendo a descrição e testando a saida - Right dois lados- (ServerFailures e SpaceMediaEntity)
  test(
    'Should get space media entity for a given date from the repository',
    () async {
      when(() => repository.getSpaceMediaFromDate(tDate)).thenAnswer(
        (_) async => const Right<ServerFailure, SpaceMediaEntity>(tSpaceMedia),
      );
      //Passando uma data pro meu usecase
      final result = await usecase(tDate);
      //Esperando o resultado sendo um tSpaceMedia
      expect(result, const Right(tSpaceMedia));
      verify(() => repository.getSpaceMediaFromDate(tDate));
    },
  );

  test(
    'Should return a ServerFailures when don\'t sucessed',
    () async {
      when(() => repository.getSpaceMediaFromDate(tDate)).thenAnswer(
          (_) async => Left<ServerFailure, SpaceMediaEntity>(Failure()));
      final result = await usecase(tDate);
      expect(result, Left(Failure()));
      verify(() => repository.getSpaceMediaFromDate(tDate));
    },
  );
}
