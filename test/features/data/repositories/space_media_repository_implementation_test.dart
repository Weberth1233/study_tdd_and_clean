import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:projeto_clean/features/data/datasources/space_media_data_source.dart';
import 'package:projeto_clean/features/data/models/space_media_model.dart';
import 'package:projeto_clean/features/data/repositories/space_media_repository_implementation.dart';

class MockSpaceMediaDatasource extends Mock implements ISpaceMediaDatasource {}

void main() {
  late SpaceMediaRepositoryImplementation repositoryImplementation;
  late ISpaceMediaDatasource datasource;

  setUp(() {
    datasource = MockSpaceMediaDatasource();
    repositoryImplementation =
        SpaceMediaRepositoryImplementation(dataSource: datasource);
  });

  const tSpaceMediaModel = SpaceMediaModel(
      description:
          'Meteors can be colorful. While the human eye usually cannot discern many colors, cameras often can.',
      mediaType: 'image',
      title: 'A Colorful Quadrantid Meteor',
      mediaUrl:
          'https://apod.nasa.gov/apod/image/2102/MeteorStreak_Kuszaj_1080.jpg');

  final tDate = DateTime(2021, 02, 02);

  test('should return space media model when calls the datasource', () async {
    when(() => datasource.getSpaceMediaFromDate(tDate))
        .thenAnswer((_) async => tSpaceMediaModel);

    final result = await repositoryImplementation.getSpaceMediaFromDate(tDate);

    expect(result, const Right(tSpaceMediaModel));
    verify(
      () => repositoryImplementation.getSpaceMediaFromDate(tDate),
    );
  });
}
