import 'package:architecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter/cupertino.dart';

class  NumberTriviaModel extends NumberTrivia {
  NumberTriviaModel({
    @required String text,
    @required int number
  }) : super(text: text, number: number);
}