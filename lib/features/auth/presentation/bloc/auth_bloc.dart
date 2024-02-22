import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecases/login.dart' as login_usecase;
import '../../domain/usecases/register.dart' as register_usecase;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final login_usecase.Login login;
  final register_usecase.Register register;
  AuthBloc({required this.login, required this.register})
      : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is UserLogin) {
        emit(LoginLoading());
        final failureOrUser = await login.call(
            login_usecase.Params(email: event.email, password: event.password));
        failureOrUser.fold((failure) {
          emit(const LoginError(
              message: 'Opps! there was an error try again later'));
        }, (user) {
          emit(LoginSuccess());
        });
      } else if (event is UserRegister) {
        emit(RegisterLoading());
        final failureOrUser = await register.call(register_usecase.Params(
            email: event.email,
            password: event.password,
            name: event.name,
            phone: event.phone));
        failureOrUser.fold((failure) {
          emit(const RegisterError(
              message: 'Opps! there was an error try again later'));
        }, (user) {
          emit(RegisterSuccess());
        });
      }
    });
  }
}
