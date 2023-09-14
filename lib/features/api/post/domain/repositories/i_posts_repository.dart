import 'package:flutter_voyage/features/api/post/domain/entities/post.dart';

abstract class IPostRepository {
  Future<List<Post>> getPosts();
  Future<Post> getPostById(String postId);
}
