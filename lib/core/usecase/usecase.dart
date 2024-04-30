import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../failures/server_failures.dart';

abstract class UseCase<Output, Input> {
  Future<Either<ServerFailure, Output>> call(Input params);
}

class NoParams extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
