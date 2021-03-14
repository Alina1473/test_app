import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_app/models/post_model.dart';

part 'post_api_client.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class PostApiClient {
  factory PostApiClient(Dio dio) = _PostApiClient;

  @GET("/posts")
  Future<List<PostModel>> getTasks();

}