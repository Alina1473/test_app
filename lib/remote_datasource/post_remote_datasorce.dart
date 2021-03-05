import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_app/models/post_model.dart';

part 'post_remote_datasorce.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/posts")
abstract class PostRemoteDatasorce {
  factory PostRemoteDatasorce(Dio dio, {String baseUrl}) = _PostRemoteDatasorce;

  @GET("/post")
  Future<List<PostModel>> getPostModel();
}