import 'package:get/get.dart';
import 'package:projeto_up/models/startup.dart';
import 'package:projeto_up/services/app_service.dart';
import 'package:projeto_up/services/user_service.dart';

class ImagesEditPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ImagesEditPageController());
  }
}

class ImagesEditPageController extends GetxController {
  final AppService appService = Get.find();
  final UserService userService = Get.find();
  final Rx<Startup> startup = Startup().obs;
  final RxString imageUrl = "".obs;
  @override
  void onInit() {
    Startup _startup = userService.startupPessoalStream();
    startup.value = _startup.clone();
    super.onInit();
  }

  bool get imageLoading {
    return appService.isImageLoading;
  }

  void handleChoosePicture() async {
    final String _imageUrl = await appService.uploadImage(userService.userId);
    if (_imageUrl != null) {
      imageUrl.value = _imageUrl;
    }
  }

  void handleSaveStartup() async {
    try {
      startup.value.album.add(imageUrl());
      await userService.saveStartup(startup());
      Get.back();
    } catch (e) {
      Get.snackbar("Erro ao salvar startup", e.toString());
    }
  }
}
