import 'package:flutter_voyage/features/api/post/domain/entities/post.dart';
import 'package:flutter_voyage/features/api/post/infrastructure/repositories/posts_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final postControllerProvider =
    AsyncNotifierProvider<PostController, List<Post>>(PostController.new);

class PostController extends AsyncNotifier<List<Post>> {
  @override
  FutureOr<List<Post>> build() =>
      ref.read(postsRepositoryImplProvider).getPosts();
}
