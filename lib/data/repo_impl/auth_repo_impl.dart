import 'package:e_learning_app/base/repo/base_repo.dart';
import 'package:e_learning_app/data/data_source/remote/service/supabase_service.dart';
import 'package:e_learning_app/domain/entity/auth/auth_entity.dart';
import 'package:e_learning_app/domain/repo/auth_repo.dart';
import 'package:e_learning_app/domain/use_case/auth/login_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../base/exception/app_exception.dart';
import '../../base/helper/result.dart';
import '../../base/helper/log.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl extends BaseRepository implements AuthRepo {
  final SupabaseService _supabaseService;

  AuthRepoImpl(this._supabaseService);

  @override
  Future<Result<AuthEntity>> login(LoginRequest req) async {
    try {
      final response = await _supabaseService.signInWithEmail(
        email: req.email,
        password: req.password,
      );

      if (response.user != null) {
        final authEntity = AuthEntity(
          id: response.user!.id,
          email: response.user!.email ?? '',
          name: response.user!.userMetadata?['name'] ?? '',
          token: response.session?.accessToken ?? '',
        );
        return Result.ok(authEntity);
      } else {
        return Result.failure(
            AppException('Login failed', type: AppExceptionType.other));
      }
    } catch (e) {
      return Result.failure(
          AppException('Login error: $e', type: AppExceptionType.other));
    }
  }

  @override
  Future<Result<AuthEntity>> signUp(
      String email, String password, String fullName) async {
    CoreLog.i('📝 AuthRepoImpl.signUp called');
    CoreLog.i('📝 Email: $email');
    CoreLog.i('📝 Full Name: $fullName');
    CoreLog.i('📝 Password length: ${password.length}');

    try {
      CoreLog.i('📝 Calling _supabaseService.signUpWithEmail...');
      final response = await _supabaseService.signUpWithEmail(
        email: email,
        password: password,
        fullName: fullName,
      );

      CoreLog.i('📝 Response received from Supabase service');
      CoreLog.i('📝 User: ${response.user != null ? 'Present' : 'Null'}');
      CoreLog.i('📝 Session: ${response.session != null ? 'Present' : 'Null'}');

      if (response.user != null) {
        CoreLog.i('📝 Creating AuthEntity...');
        final authEntity = AuthEntity(
          id: response.user!.id,
          email: response.user!.email ?? '',
          name: response.user!.userMetadata?['name'] ?? fullName,
          token: response.session?.accessToken ?? '',
        );
        CoreLog.i('📝 AuthEntity created successfully');
        CoreLog.i('📝 AuthEntity ID: ${authEntity.id}');
        CoreLog.i('📝 AuthEntity Email: ${authEntity.email}');
        CoreLog.i('📝 AuthEntity Name: ${authEntity.name}');
        return Result.ok(authEntity);
      } else {
        CoreLog.e('📝 Sign up failed - no user returned');
        return Result.failure(
            AppException('Sign up failed', type: AppExceptionType.other));
      }
    } catch (e, stackTrace) {
      CoreLog.e('📝 Sign up error in AuthRepoImpl');
      CoreLog.e('📝 Error: $e');
      CoreLog.e('📝 Stack trace: $stackTrace');
      return Result.failure(
          AppException('Sign up error: $e', type: AppExceptionType.other));
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      await _supabaseService.signOut();
      return const Result.ok(null);
    } catch (e) {
      return Result.failure(
          AppException('Logout error: $e', type: AppExceptionType.other));
    }
  }
}
