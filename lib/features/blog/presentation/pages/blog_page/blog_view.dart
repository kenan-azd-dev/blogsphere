import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// 3rd Party Packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

// Project Files
import '../../../../../core/core.dart';
import '../../../../../core/common/widgets/about_list_tile.dart' as about;
import '../../../../shared/widgets/log_out_button.dart';
import '../../bloc/blog_bloc.dart';
import '../../widgets/blog_card.dart';

class BlogView extends StatefulWidget {
  const BlogView({super.key});

  @override
  State<BlogView> createState() => _BlogViewState();
}

class _BlogViewState extends State<BlogView> {
  @override
  void initState() {
    super.initState();
    context.read<BlogBloc>().add(BlogFetchAllBlogs());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppUserCubit, AppUserState>(
      listener: (context, state) {
        if (state is AppUserInitial) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            signUp,
            (route) => false,
          );
        }
      },
      child: Scaffold(
        drawer: const Drawer(
          child: SafeArea(
            child: Column(
              children: [
                Gap(32),
                SizedBox(
                  width: double.maxFinite,
                  child: AppLogo(
                    size: 150,
                    style: AppLogoStyle.stacked,
                  ),
                ),
                Gap(32),
                LogOutListTile(),
                Divider(),
                ThemeModeListTile(),
                Divider(),
                about.AboutListTile(),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: const AppLogo(
            size: 150,
            style: AppLogoStyle.textOnly,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, addNewBlogPage);
              },
              icon: const Icon(
                CupertinoIcons.add_circled,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: BlocConsumer<BlogBloc, BlogState>(
            listener: (context, state) {
              if (state is BlogFailure) {
                showSnackBar(context, state.error);
              }
            },
            builder: (context, state) {
              if (state is BlogLoading) {
                return const Loader();
              }
              if (state is BlogsDisplaySuccess) {
                return ListView.builder(
                  itemCount: state.blogs.length,
                  itemBuilder: (context, index) {
                    final blog = state.blogs[index];
                    return BlogCard(
                      blog: blog,
                      color: index % 2 == 0
                          ? AppColors.gradient1
                          : AppColors.gradient2,
                    );
                  },
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
