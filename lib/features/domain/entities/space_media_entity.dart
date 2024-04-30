import 'package:equatable/equatable.dart';

//Esqueleto - entity

class SpaceMediaEntity extends Equatable {
  final String description;
  final String mediaType;
  final String title;
  final String mediaUrl;

  const SpaceMediaEntity({
    required this.description,
    required this.mediaType,
    required this.title,
    required this.mediaUrl,
  });

  //Equatable pacote para comparar dois objetos diferentes para teste é muito util
  @override
  // TODO: implement props
  List<Object?> get props => [
        description,
        mediaType,
        title,
        mediaUrl,
      ];
}
