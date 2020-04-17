import 'package:architecture/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInteger(String str) {
    try{
      int number = int.parse(str);
      if( number < 0) throw FormatException();
      return Right(number);
    } on FormatException {
      return Left(InvalidInputFailure());
    }

  }
}

class InvalidInputFailure extends Failure {

}