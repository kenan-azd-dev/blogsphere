import 'package:flutter/material.dart';

// 3rd Party Packages
import 'package:bloc/bloc.dart';

// Project Files
import '../../../../../core/core.dart';
import '../../../domain/usecases/get_current_user_usecase.dart';
import '../../../domain/usecases/log_in_usecase.dart';
import '../../../domain/usecases/log_out_usecase.dart';
import '../../../domain/usecases/sign_up_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required UserSignUpUseCase userSignUpUseCase,
    required UserLoginUseCase userLogInUseCase,
    required UserLogOutUseCase userLogOutUseCase,
    required CurrentUserUseCase currentUserUseCase,
    required AppUserCubit appUserCubit,
  })  : _userSignUpUseCase = userSignUpUseCase,
        _userLogInUseCase = userLogInUseCase,
        _userLogOutUseCase = userLogOutUseCase,
        _currentUserUseCase = currentUserUseCase,
        _appUserCubit = appUserCubit,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<UserSignedUpEvent>(_userSignedUp);
    on<UserLoggedInEvent>(_userLoggedIn);
    on<UserLoggedOutEvent>(_userLoggedOut);
    on<IsUserLoggedInEvent>(_isUserLoggedOn);
  }

  final UserSignUpUseCase _userSignUpUseCase;
  final UserLoginUseCase _userLogInUseCase;
  final UserLogOutUseCase _userLogOutUseCase;
  final CurrentUserUseCase _currentUserUseCase;
  final AppUserCubit _appUserCubit;

  void _userSignedUp(
    UserSignedUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _userSignUpUseCase(UserSignUpParams(
      email: event.email,
      password: event.password,
      name: event.name,
    ));

    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  void _userLoggedIn(
    UserLoggedInEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _userLogInUseCase(UserLoginParams(
      email: event.email,
      password: event.password,
    ));

    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  void _isUserLoggedOn(
    IsUserLoggedInEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _currentUserUseCase(NoParams());
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  _userLoggedOut(
    UserLoggedOutEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _userLogOutUseCase(NoParams());

    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (_) {
        _appUserCubit.updateUser(null);
        emit(Unauthenticated());
      },
    );
  }

  void _emitAuthSuccess(
    User user,
    Emitter<AuthState> emit,
  ) {
    _appUserCubit.updateUser(user);
    emit(AuthSuccess(user));
  }
}
