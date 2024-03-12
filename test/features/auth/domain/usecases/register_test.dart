import 'package:dartz/dartz.dart';
import 'package:doc_app/features/auth/domain/entities/user.dart';
import 'package:doc_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:doc_app/features/auth/domain/usecases/register.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'register_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late RegisterUsecase usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = RegisterUsecase(repository: mockAuthRepository);
  });

  test('Should return user from the repository', () async {
    //arrange
    const tEmail = "sali@gmail.com";
    const tPassword = "Aser@1234";
    const tPhone = "01012345678";
    const tName = "Salsabil";
    const tUser =
        User(email: tEmail, password: tPassword, phone: tPhone, name: tName);
    when(mockAuthRepository.register(
            email: tEmail, password: tPassword, phone: tPhone, name: tName))
        .thenAnswer((_) async => const Right(tUser));

    //act

    final result = await usecase(const RegisterParams(
        email: tEmail, password: tPassword, name: tName, phone: tPhone));
    //assert
    expect(result, const Right(tUser));
  });
}
