import 'package:test_app/models/user_model.dart';
import 'package:test_app/repository/user_repository.dart';

class UserBloc{
  final UserRepository _userRepository;

  UserBloc(this._userRepository){
    final List<UserModel> _postmodel = _userRepository.userRepository();
  }

}