import 'package:architecture/core/error/failures.dart';
import 'package:architecture/core/usecases/usecase.dart';
import 'package:architecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:architecture/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';


class GetRandomNumberTrivia implements Usecase<NumberTrivia,NoParams> {
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams  params) async {
    return await repository.getRandomNumberTrivia();
  }

}

class NoParams extends Equatable {
}