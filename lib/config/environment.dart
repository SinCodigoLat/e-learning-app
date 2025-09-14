abstract class EnvironmentConfigurable {
  String getBaseUrl();
  String getBrandName();
  String getSupabaseUrl();
  String getSupabaseAnonKey();
}

class AppEnvironment extends EnvironmentConfigurable {
  final String apiBaseUrl;
  final String brandName;
  final String supabaseUrl;
  final String supabaseAnonKey;

  AppEnvironment({
    required this.apiBaseUrl,
    required this.brandName,
    required this.supabaseUrl,
    required this.supabaseAnonKey,
  });

  static AppEnvironment dev = AppEnvironment(
    apiBaseUrl: 'https://qczrvephdmmzihaurtdm.supabase.co',
    brandName: 'E-Learning',
    supabaseUrl: 'https://qczrvephdmmzihaurtdm.supabase.co',
    supabaseAnonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFjenJ2ZXBoZG1temloYXVydGRtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc4Njk0NTIsImV4cCI6MjA3MzQ0NTQ1Mn0.xR1SOqjRgEQytJ0MC7-9FfYUoynh54UBU9BcTcHJhLg',
  );

  static AppEnvironment prod = AppEnvironment(
    apiBaseUrl: 'https://qczrvephdmmzihaurtdm.supabase.co',
    brandName: 'E-Learning',
    supabaseUrl: 'https://qczrvephdmmzihaurtdm.supabase.co',
    supabaseAnonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFjenJ2ZXBoZG1temloYXVydGRtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc4Njk0NTIsImV4cCI6MjA3MzQ0NTQ1Mn0.xR1SOqjRgEQytJ0MC7-9FfYUoynh54UBU9BcTcHJhLg',
  );

  @override
  String getBaseUrl() {
    return apiBaseUrl;
  }

  @override
  String getBrandName() {
    return brandName;
  }

  @override
  String getSupabaseUrl() {
    return supabaseUrl;
  }

  @override
  String getSupabaseAnonKey() {
    return supabaseAnonKey;
  }
}
