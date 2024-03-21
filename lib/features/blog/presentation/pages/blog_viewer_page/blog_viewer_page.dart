import 'package:flutter/material.dart';

// Project Files
import '../../../domain/entities/blog.dart';
import './blog_viewer_view.dart';

class BlogViewerPage extends StatelessWidget {
  const BlogViewerPage({
    super.key,
    required Blog blog,
  }) : _blog = blog;

  final Blog _blog;

  @override
  Widget build(BuildContext context) {
    return BlogViewerView(blog: _blog);
  }
}
