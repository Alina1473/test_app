import 'package:test_app/models/post_model.dart';
import 'package:test_app/repository/post_repository.dart';

class PostBloc{
  final PostRepository _postRepository;

  PostBloc(this._postRepository){
    final List<PostModel> _postmodel = _postRepository.postRepository();
  }

}