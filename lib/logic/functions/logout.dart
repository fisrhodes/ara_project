import 'package:ara_vnext/logic/services/storage_services.dart';
import 'package:ara_vnext/views/shared/utils/app_router.dart';

import '../../locator.dart';

Future logout() async {
  await sl<StorageServices>().deleteUser();
  AppRouter.pushReplacementNamed(AppRoutes.login);
}
