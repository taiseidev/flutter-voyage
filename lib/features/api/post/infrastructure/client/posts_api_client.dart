import 'package:dio/dio.dart';
import 'package:flutter_voyage/features/api/post/domain/entities/post.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'posts_api_client.g.dart';

@Riverpod(keepAlive: true)
PostsApiClient postsApiClient(PostsApiClientRef ref) {
  return PostsApiClient(
    Dio()
      ..interceptors.addAll(
        [
          LogInterceptor(
            requestBody: true,
            responseBody: true,
          ),
        ],
      ),
    baseUrl: 'https://jsonplaceholder.typicode.com',
  );
}

@RestApi()
abstract class PostsApiClient {
  factory PostsApiClient(Dio dio, {String baseUrl}) = _PostsApiClient;

  static const endpoint = "/posts";

  @GET(endpoint)
  Future<List<Post>> getPosts();

  @GET("$endpoint/{id}")
  Future<Post> getPostById(@Path("id") String id);
}
