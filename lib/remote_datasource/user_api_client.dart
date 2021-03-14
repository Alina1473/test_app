import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_app/models/user_model.dart';

part 'user_api_client.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class UserApiClient {
  factory UserApiClient(Dio dio) = _UserApiClient;

  @GET("/users")
  Future<List<UserModel>> getTasks();

  @GET("/users/{id}")
  Future<UserModel> getTask(@Path("id") String id);

}