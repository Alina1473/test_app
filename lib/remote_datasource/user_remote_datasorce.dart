import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_app/models/user_model.dart';

part 'user_remote_datasorce.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/users/{id}")
abstract class UserRemoteDatasorce {
  factory UserRemoteDatasorce(Dio dio, {String baseUrl}) = _UserRemoteDatasorce;

  @GET("/user")
  Future<List<UserModel>> getUserModel();

  @GET("/user/{id}")
  Future<UserModel> getUserId(@Path("id") String id);
}