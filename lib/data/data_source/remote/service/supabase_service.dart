import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_bloc_template/config/environment.dart';

@lazySingleton
class SupabaseService {
  late SupabaseClient _client;

  SupabaseService() {
    _initializeClient();
  }

  void _initializeClient() {
    _client = SupabaseClient(
      AppEnvironment.dev.getSupabaseUrl(),
      AppEnvironment.dev.getSupabaseAnonKey(),
    );
  }

  SupabaseClient get client => _client;

  // Auth methods
  Future<AuthResponse> signInWithEmail({
    required String email,
    required String password,
  }) async {
    return await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<AuthResponse> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    return await _client.auth.signUp(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _client.auth.signOut();
  }

  User? get currentUser => _client.auth.currentUser;

  Stream<AuthState> get authStateChanges => _client.auth.onAuthStateChange;
}
