import 'package:ara_vnext/locator.dart';
import 'package:ara_vnext/logic/services/storage_services.dart';
import 'package:ara_vnext/views/shared/utils/app_router.dart';

Future<void> checkUserLogged() async {
  final user = await sl<StorageServices>().loadUserFromStorage();
  if(user!=null){
    AppRouter.pushReplacementNamed(AppRoutes.main);
  }
}
