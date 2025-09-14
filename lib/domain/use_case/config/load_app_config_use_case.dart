import 'package:e_learning_app/base/use_case/base_use_case.dart';
import 'package:e_learning_app/base/use_case/sync_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../entity/config/load_app_config_entity.dart';

@injectable
class LoadAppConfigUseCase extends SyncUseCase<LoadAppConfigEntity, NoParam?> {
  @override
  LoadAppConfigEntity invoke(NoParam? param) {
    final user = Supabase.instance.client.auth.currentUser;
    final isLoggedIn = user != null;

    return LoadAppConfigEntity(
      isFirstLaunchApp: !isLoggedIn, // Solo es primera vez si no está logueado
      isDarkMode: false,
      isLoggedIn: isLoggedIn,
    );
  }
  // @override
  // Future<LoadAppConfigEntity> invoke(NoParam? param) async {
  //   return LoadAppConfigEntity(
  //     isFirstLaunchApp: true,
  //     isDarkMode: false,
  //     isLoggedIn: false,
  //   );
  // }
}
