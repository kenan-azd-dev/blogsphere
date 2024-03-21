import 'dart:io';

// 3rd Party Packages
import 'package:fpdart/fpdart.dart';

// Project Files
import '../../../../core/core.dart';
import '../entities/blog.dart';

abstract interface class BlogRepository {
  Future<Either<Failure, Blog>> uploadBlog({
    required File image,
    required String title,
    required String content,
    required String userId,
    required List<String> topics,
  });

  Future<Either<Failure, List<Blog>>> getAllBlogs();
}
