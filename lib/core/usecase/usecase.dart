// 3rd Party Packages
import 'package:fpdart/fpdart.dart';

// Project Files
import '../error/failure.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

class NoParams {}