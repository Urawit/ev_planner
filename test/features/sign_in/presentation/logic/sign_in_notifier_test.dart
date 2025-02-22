import 'package:dartz/dartz.dart';
import 'package:ev_planner/features/sign_in/data/data.dart';
import 'package:ev_planner/features/sign_in/domain/domain.dart';
import 'package:ev_planner/features/sign_in/presentation/logic/logic.dart';
import 'package:ev_planner/shared/error/error_message_model.dart';
import 'package:ev_planner/shared/exception/exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class SignInUseCaseMock extends Mock implements SignInUseCase {}

class SessionModelMock extends Mock implements SessionModel {}

class SignInInputEntityFake extends Fake implements SignInInputEntity {}

void main() {
  const String email = "admin@gmail.com";
  const String password = "admin";

  late SignInUseCaseMock signInUseCaseMock;
  late SessionModelMock sessionModelMock;
  late ProviderContainer container;

  setUp(() {
    signInUseCaseMock = SignInUseCaseMock();
    sessionModelMock = SessionModelMock();

    container = ProviderContainer(overrides: [
      signInUseCaseProvider.overrideWithValue(signInUseCaseMock),
    ]);
  });

  setUpAll(() {
    registerFallbackValue(SignInInputEntityFake());
  });

  group('SignInNotifer', () {
    test(
        'Given User '
        'When sign in sucessfully'
        'Then get state success', () async {
      // mock usecase to get SessionModel
      when(() => signInUseCaseMock.call(
            signInInput: any(named: 'signInInput'),
          )).thenAnswer((_) async => Right(sessionModelMock));
      final notifier = container.read(signInProvider.notifier);

      final List<SignInState> signInState = [];
      container.listen(signInProvider, (_, state) => signInState.add(state),
          fireImmediately: true);

      await notifier.signIn(
          signInInput:
              const SignInInputModel(email: email, password: password));

      final expectedStates = [
        const SignInState.initial(),
        const SignInState.loading(),
        SignInState.success(data: sessionModelMock)
      ];

      expect(signInState, expectedStates);
    });

    test(
        'Given User '
        'When sign in and got error'
        'Then get state error', () async {
      const AnyException exception = AnyException(ErrorMessageModel());
      // mock usecase to get SessionModel
      when(() => signInUseCaseMock.call(
            signInInput: any(named: 'signInInput'),
          )).thenAnswer((_) async => const Left(exception));
      final notifier = container.read(signInProvider.notifier);

      final List<SignInState> signInState = [];
      container.listen(signInProvider, (_, state) => signInState.add(state),
          fireImmediately: true);

      await notifier.signIn(
          signInInput:
              const SignInInputModel(email: email, password: password));

      final expectedStates = [
        const SignInState.initial(),
        const SignInState.loading(),
        const SignInState.error(exception)
      ];

      expect(signInState, expectedStates);
    });
  });
}
