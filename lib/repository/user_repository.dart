import 'package:dio/dio.dart';
import 'package:test_app/remote_datasource/user_remote_datasorce.dart';

class UserRepository{
  UserRemoteDatasorce _userRequest;
  Dio dio;

  userRepository(){
    dio = Dio();
    _userRequest= UserRemoteDatasorce(dio);
  }
}