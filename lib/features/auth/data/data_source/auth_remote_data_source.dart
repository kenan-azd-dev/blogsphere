// 3rd Party Packages
import 'package:supabase_flutter/supabase_flutter.dart';

// Project Files
import '../../../../core/error/server_exception.dart';
import '../models/user_model.dart';

part 'auth_remote_data_source_impl.dart';

abstract interface class AuthRemoteDataSource {
  Session? get currentUserSession;
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<UserModel> loginWithEmailPassword({
    required String email,
    required String password,
  });
  Future<UserModel?> getCurrentUserData();
}