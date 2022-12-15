import 'package:get_storage/get_storage.dart';

Future<void> initCaches() async {
  await GetStorage.init();
  await GetStorage.init('auth_storage');
}
