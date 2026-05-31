import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lost_n_found/core/services/hive/hive_service.dart';
import 'package:lost_n_found/features/auth/data/datasources/auth_datasource.dart';
import 'package:lost_n_found/features/auth/data/models/auth_hive_model.dart';
 
// Provider
final authLocalDatasourceProvider = Provider<AuthLocalDatasource>((ref) {
  final hiveService = ref.watch(hiveServiceProvider);
  return AuthLocalDatasource(hiveService: hiveService);
});
 
class AuthLocalDatasource implements IAuthDataSource {
  final HiveService _hiveService;
 
  AuthLocalDatasource({required HiveService hiveService})
    : _hiveService = hiveService;
 
  @override
  Future<AuthHiveModel?> getCurrentUser() async {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }
 
  @override
  Future<bool> isEmailExists(String email) async {
    try {
      final exists = await _hiveService.isEmailExists(email);
      return exists;
    } catch (e) {
      return false;
    }
  }
 
  @override
  Future<AuthHiveModel?> login(String email, String password) async {
    try {
      final user = await _hiveService.loginUser(email, password);
      return user;
    } catch (e) {
      return null;
    }
  }
 
  @override
  Future<bool> logout() async {
    try {
      await _hiveService.logoutUser();
      return true;
    } catch (e) {
      return false;
    }
  }
 
  @override
  Future<bool> register(AuthHiveModel model) async {
    try {
      await _hiveService.registerUser(model);
      return true;
    } catch (e) {
      return false;
    }
  }
}
 
 