import 'package:dartz/dartz.dart';
import 'package:doc_app/features/auth/domain/entities/user.dart';
import 'package:doc_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:doc_app/features/auth/domain/usecases/login.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late LoginUsecase usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = LoginUsecase(repository: mockAuthRepository);
  });

  test('Should return user from the repository', () async {
    //arrange
    const tEmail = "sali@gmail.com";
    const tPassword = "Aser@1234";
    const tUser = User(email: tEmail, password: tPassword);
    when(mockAuthRepository.login(email: tEmail, password: tPassword))
        .thenAnswer((_) async => const Right(tUser));

    //act

    final result =
        await usecase(const LoginParams(email: tEmail, password: tPassword));
    //assert
    expect(result, const Right(tUser));
  });
}
