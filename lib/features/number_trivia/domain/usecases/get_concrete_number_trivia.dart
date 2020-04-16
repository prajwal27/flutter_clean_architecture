import 'package:architecture/core/error/failures.dart';
import 'package:architecture/core/usecases/usecase.dart';
import 'package:architecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:architecture/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


class GetConcreteNumberTrivia implements Usecase<NumberTrivia,Params> {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(Params  params) async {
    return await repository.getConcreteNumberTrivia(params.number);
  }

  /*Future<Either<Failure, NumberTrivia>> executeRandom() async {
    return await repository.getRandomNumberTrivia();
  }*/
}

class Params extends Equatable {
  final int number;

  Params({@required this.number}) : super([number]);
}