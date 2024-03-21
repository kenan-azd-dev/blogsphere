// 3rd Party Packages
import 'package:fpdart/fpdart.dart';

// Project Files
import '../../../../core/core.dart';
import '../repository/auth_repository.dart';

class UserLogOutUseCase implements UseCase<void, NoParams> {
  final AuthRepository authRepository;
  const UserLogOutUseCase(this.authRepository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async =>
      await authRepository.logOut();
}


