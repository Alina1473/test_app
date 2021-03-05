import 'package:dio/dio.dart';
import 'package:test_app/remote_datasource/post_remote_datasorce.dart';
 
class PostRepository{
  PostRemoteDatasorce _postRequest;
  Dio dio;

  postRepository(){
    dio = Dio();
    _postRequest = PostRemoteDatasorce(dio);
  }
}