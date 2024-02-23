import 'package:bloc/bloc.dart';
import 'package:doc_app/core/theme/app_colors.dart';
import 'package:doc_app/features/auth/domain/usecases/register.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/utils/snack_bar.dart';
import '../../domain/usecases/login.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase login;
  final RegisterUsecase register;
  AuthBloc({required this.login, required this.register})
      : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is UserLogin) {
        await _loginEvent(emit, event);
      } else if (event is UserRegister) {
        await _registerEvent(emit, event);
      }
    });
  }

  Future<void> _registerEvent(
      Emitter<AuthState> emit, UserRegister event) async {
    emit(RegisterLoading());
    final failureOrUser = await register.call(RegisterParams(
        email: event.email,
        password: event.password,
        name: event.name,
        phone: event.phone));
    failureOrUser.fold((failure) {
      emit(RegisterError(message: failure.message));
      showSnackBar('The email or phone has been used before', AppColors.red);
    }, (user) {
      emit(RegisterSuccess());
      //NAVIGATE
    });
  }

  Future<void> _loginEvent(Emitter<AuthState> emit, UserLogin event) async {
    emit(LoginLoading());
    final failureOrUser = await login
        .call(LoginParams(email: event.email, password: event.password));
    failureOrUser.fold((failure) {
      emit(LoginError(message: failure.message));
      showSnackBar(
          'This email doesn\'t match of any users try to Register and then try again',
          AppColors.red);
    }, (user) {
      emit(LoginSuccess());
      showSnackBar("Loggedin Successfuly.", AppColors.green);
      //NAVIGATE
    });
  }
}
