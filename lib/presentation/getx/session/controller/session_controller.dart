import 'package:get/get.dart';

import '../../../../core/storage/get_storage_manager.dart';

class SessionController extends GetxController {

  final GetStorageManager storageManager;

  SessionController(this.storageManager);

  void clearUserSession() {
    storageManager.auth = null;
  }
}