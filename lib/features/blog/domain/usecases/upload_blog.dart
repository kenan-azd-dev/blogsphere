import 'dart:io';

// 3rd Party Packages
import 'package:fpdart/fpdart.dart';

// Project Files
import '../../../../core/core.dart';
import '../entities/blog.dart';
import '../repositories/blog_repository.dart';

class UploadBlog implements UseCase<Blog, UploadBlogParams> {
  final BlogRepository blogRepository;
  UploadBlog(this.blogRepository);

  @override
  Future<Either<Failure, Blog>> call(UploadBlogParams params) async {
    return await blogRepository.uploadBlog(
      image: params.image,
      title: params.title,
      content: params.content,
      userId: params.userId,
      topics: params.topics,
    );
  }
}

class UploadBlogParams {
  final String userId;
  final String title;
  final String content;
  final File image;
  final List<String> topics;

  UploadBlogParams({
    required this.userId,
    required this.title,
    required this.content,
    required this.image,
    required this.topics,
  });
}
