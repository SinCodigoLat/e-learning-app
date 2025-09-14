import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:e_learning_app/base/helper/log.dart';

@lazySingleton
class SupabaseService {
  SupabaseClient get client => Supabase.instance.client;

  // Auth methods
  Future<AuthResponse> signInWithEmail({
    required String email,
    required String password,
  }) async {
    CoreLog.i('🔐 Starting sign in process...');
    CoreLog.i('🔐 Email: $email');

    try {
      final response = await client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      CoreLog.i('✅ Sign in successful!');
      CoreLog.i('✅ User ID: ${response.user?.id}');
      CoreLog.i('✅ Session: ${response.session != null ? 'Present' : 'Null'}');

      return response;
    } catch (e, stackTrace) {
      CoreLog.e('❌ Sign in failed!');
      CoreLog.e('❌ Error: $e');
      CoreLog.e('❌ Stack trace: $stackTrace');
      rethrow;
    }
  }

  Future<AuthResponse> signUpWithEmail({
    required String email,
    required String password,
    String? fullName,
  }) async {
    CoreLog.i('🚀 Starting sign up process...');
    CoreLog.i('🚀 Email: $email');
    CoreLog.i('🚀 Full Name: $fullName');
    CoreLog.i('🚀 Password length: ${password.length}');

    try {
      CoreLog.i('🔧 Calling client.auth.signUp...');
      final response = await client.auth.signUp(
        email: email,
        password: password,
        data: fullName != null
            ? {
                'name': fullName,
                'full_name': fullName,
              }
            : null,
      );

      CoreLog.i('✅ Sign up successful!');
      CoreLog.i('✅ User ID: ${response.user?.id}');
      CoreLog.i('✅ Session: ${response.session != null ? 'Present' : 'Null'}');

      return response;
    } catch (e, stackTrace) {
      CoreLog.e('❌ Sign up failed!');
      CoreLog.e('❌ Error: $e');
      CoreLog.e('❌ Stack trace: $stackTrace');
      rethrow;
    }
  }

  Future<void> signOut() async {
    CoreLog.i('🚪 Starting sign out process...');
    try {
      await client.auth.signOut();
      CoreLog.i('✅ Sign out successful!');
    } catch (e, stackTrace) {
      CoreLog.e('❌ Sign out failed!');
      CoreLog.e('❌ Error: $e');
      CoreLog.e('❌ Stack trace: $stackTrace');
      rethrow;
    }
  }

  User? get currentUser => client.auth.currentUser;

  Stream<AuthState> get authStateChanges => client.auth.onAuthStateChange;
}
