import 'package:picks_empire/data/sources/remote/auth_remote_source.dart';
import 'package:picks_empire/domain/entities/auth_model/user_entities.dart';
import 'package:picks_empire/domain/repository/auth_repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteSource _remoteSource;
  AuthRepositoryImpl(this._remoteSource);

  @override
  Future<UserEntity> signUp(String name, String email, String password) async {
    final response = await _remoteSource.SignUp({
      "name": name,
      "email": email,
      "password": password,
    });
    // Mapping Data Model to Domain Entity
    return UserEntity(name: name, email: email);
  }

  // @override
  // Future<dynamic> signUp(String name, String email, String password) async {
  //   final body = {"name": name, "email": email, "password": password};
  //   return await _remoteSource.SignUp(body);
  // }
}
