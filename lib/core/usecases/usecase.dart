import 'package:architecture/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class Usecase<Type, Params> {

  Future<Either<Failure, Type>> call(Params params);
}