// 3rd Party Packages
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Project Files
import '../core/core.dart';
import '../features/auth/data/data_source/auth_remote_data_source.dart';
import '../features/auth/data/repository/auth_repository_impl.dart';
import '../features/auth/domain/repository/auth_repository.dart';
import '../features/auth/domain/usecases/get_current_user_usecase.dart';
import '../features/auth/domain/usecases/log_in_usecase.dart';
import '../features/auth/domain/usecases/sign_up_usecase.dart';
import '../features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../features/blog/data/data_source/local/blog_local_data_source.dart';
import '../features/blog/data/data_source/local/blog_local_data_source_impl.dart';
import '../features/blog/data/data_source/remote/blog_remote_data_source.dart';
import '../features/blog/data/data_source/remote/blog_remote_data_source_impl.dart';
import '../features/blog/data/repositories/blog_repository_impl.dart';
import '../features/blog/domain/repositories/blog_repository.dart';
import '../features/blog/domain/usecases/get_all_blogs.dart';
import '../features/blog/domain/usecases/upload_blog.dart';
import '../features/blog/presentation/bloc/blog_bloc.dart';

part 'injection_container.main.dart';