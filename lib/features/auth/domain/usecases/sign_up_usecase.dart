// 3rd Party Packages
import 'package:fpdart/fpdart.dart';

// Project Files
import '../../../../core/core.dart';
import '../repository/auth_repository.dart';

class UserSignUpUseCase implements UseCase<User, UserSignUpParams> {
  final AuthRepository authRepository;
  const UserSignUpUseCase(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async =>
      await authRepository.signUpWithEmailPassword(
        name: params.name,
        email: params.email,
        password: params.password,
      );
}

class UserSignUpParams {
  final String email;
  final String password;
  final String name;
  UserSignUpParams({
    required this.email,
    required this.password,
    required this.name,
  });
}
