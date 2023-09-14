import 'package:flutter_voyage/features/api/post/domain/entities/post.dart';
import 'package:flutter_voyage/features/api/post/infrastructure/repositories/posts_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_post_usecase.g.dart';

@riverpod
Future<Post> getPostUsecase(GetPostUsecaseRef ref, String postId) async {
  return await ref.read(postsRepositoryImplProvider).getPostById(postId);
}
