import 'package:architecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:architecture/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/failures.dart';

class GetConcreteNumberTrivia {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  Future<Either<Failure, NumberTrivia>> call({
    @required int number,
  }) async {
    return await repository.getConcreteNumberTrivia(number);
  }

  Future<Either<Failure, NumberTrivia>> executeRandom() async {
    return await repository.getRandomNumberTrivia();
  }
}