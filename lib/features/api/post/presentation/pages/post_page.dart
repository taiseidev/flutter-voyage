import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_voyage/features/api/post/domain/entities/post.dart';
import 'package:flutter_voyage/features/api/post/presentation/controller/post_controller.dart';
import 'package:flutter_voyage/features/api/post/presentation/pages/post_detail_page.dart';

class PostPage extends ConsumerWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("投稿一覧"),
      ),
      body: posts.when(
        data: (posts) => ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return ProviderScope(
              overrides: [_currentPostProvider.overrideWithValue(post)],
              child: const _ListItem(),
            );
          },
        ),
        error: (error, stackTrace) => Center(
          child: Text(error.toString()),
        ),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}

final _currentPostProvider = Provider<Post>(
  (_) => throw UnimplementedError(),
);

class _ListItem extends ConsumerWidget {
  const _ListItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final post = ref.watch(_currentPostProvider);
    return Card(
      child: ListTile(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostDetailPage(postId: post.id.toString()),
          ),
        ),
        leading: Text(
          "userId：${post.userId}",
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        title: Text(
          post.title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
