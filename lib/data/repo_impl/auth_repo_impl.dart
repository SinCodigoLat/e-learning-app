import 'package:flutter_bloc_template/base/repo/base_repo.dart';
import 'package:flutter_bloc_template/data/data_source/remote/service/supabase_service.dart';
import 'package:flutter_bloc_template/domain/entity/auth/auth_entity.dart';
import 'package:flutter_bloc_template/domain/repo/auth_repo.dart';
import 'package:flutter_bloc_template/domain/use_case/auth/login_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../base/exception/app_exception.dart';
import '../../base/helper/result.dart';

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
