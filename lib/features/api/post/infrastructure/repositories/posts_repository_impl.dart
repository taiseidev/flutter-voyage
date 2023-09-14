import 'package:flutter_voyage/features/api/post/domain/entities/post.dart';
import 'package:flutter_voyage/features/api/post/domain/repositories/i_posts_repository.dart';
import 'package:flutter_voyage/features/api/post/infrastructure/client/posts_api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'posts_repository_impl.g.dart';

@riverpod
PostsRepositoryImpl postsRepositoryImpl(PostsRepositoryImplRef ref) =>
    PostsRepositoryImpl(ref.read(postsApiClientProvider));

class PostsRepositoryImpl extends IPostRepository {
  PostsRepositoryImpl(this._apiClient);

  final PostsApiClient _apiClient;

  @override
  Future<List<Post>> getPosts() async {
    late final List<Post> posts;
    try {
      posts = await _apiClient.getPosts();
    } catch (e) {}
    return posts;
  }

  @override
  Future<Post> getPostById(String postId) async {
    return await _apiClient.getPostById(postId);
  }
}
