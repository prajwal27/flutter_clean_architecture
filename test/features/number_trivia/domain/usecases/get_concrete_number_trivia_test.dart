import 'package:architecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:architecture/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:architecture/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock implements NumberTriviaRepository {

}

void main() {
  GetConcreteNumberTrivia usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });


  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');
  test(
      'should get trivia for the number from the repository',
          () async {
        // arrange
        // "On the fly" implementation of the Repository using the Mockito package.
        // When getConcreteNumberTrivia is called with any argument, always answer with
        // the Right "side" of Either containing a test NumberTrivia object.
        when(mockNumberTriviaRepository.getConcreteNumberTrivia(any))
            .thenAnswer((_) async => Right(tNumberTrivia));

       /* when(mockNumberTriviaRepository.getRandomNumberTrivia())
            .thenAnswer((_) async => Right(tNumberTrivia));*/
        // act
        final result = await usecase(Params(number: tNumber));
        //final randomResult = await usecase.executeRandom();

        // UseCase should simply return whatever was returned from the Repository
        expect(result, Right(tNumberTrivia));
        //expect(randomResult, Right(tNumberTrivia));

        // Verify that the method has been called on the Repository
        verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
        //verify(mockNumberTriviaRepository.getRandomNumberTrivia());

        // Only the above method should be called and nothing more.
        verifyNoMoreInteractions(mockNumberTriviaRepository);
      }
  );

  /*test(
      'should get trivia for the Random number from the repository',
          () async {
        // arrange

        when(mockNumberTriviaRepository.getRandomNumberTrivia())
            .thenAnswer((_) async => Right(tNumberTrivia));
        // act
        final randomResult = await usecase.executeRandom();

        // UseCase should simply return whatever was returned from the Repository
        expect(randomResult, Right(tNumberTrivia));

        // Verify that the method has been called on the Repository
        verify(mockNumberTriviaRepository.getRandomNumberTrivia());

        // Only the above method should be called and nothing more.
        verifyNoMoreInteractions(mockNumberTriviaRepository);
      }
  );*/
}