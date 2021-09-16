import 'package:ara_vnext/logic/services/api_services.dart';
import 'package:ara_vnext/logic/vm/home_vm.dart';
import 'package:get_it/get_it.dart';

import 'logic/services/auth_services.dart';
import 'logic/services/storage_services.dart';
import 'logic/vm/login_vm.dart';

final sl = GetIt.I;

Future<void> setupLocator() async {
  sl.registerLazySingleton(() => AuthServices());
  sl.registerLazySingleton(() => StorageServices());
  await sl<StorageServices>().loadUserFromStorage();
  sl.registerLazySingleton(() => ApiServices());

  sl.registerLazySingleton(() => LoginViewModel());
  sl.registerLazySingleton(() => HomeViewModel());
}
