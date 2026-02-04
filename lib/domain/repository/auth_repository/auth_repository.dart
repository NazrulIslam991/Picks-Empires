import 'package:picks_empire/domain/entities/auth_model/user_entities.dart';

abstract class AuthRepository {
  // signUp method
  Future<UserEntity> signUp(String name, String email, String password);
}
