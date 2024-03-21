// 3rd Party Packages
import 'package:fpdart/fpdart.dart';

// Project Files
import '../../../../core/core.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, User>> loginWithEmailPassword({
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> logOut();
  Future<Either<Failure, User>> currentUser();
}