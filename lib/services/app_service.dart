// Essa classe gerencia as features gerais do app, como
// ir para a home depois do splash, e mostrar o onboarding
// pela primeira vez, alem de iniciar os outros servicos.

import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_up/services/projects_service.dart';
import 'package:projeto_up/services/router_service.dart';
import 'package:projeto_up/services/startup_service.dart';
import 'package:projeto_up/services/user_service.dart';
import 'package:projeto_up/ui/components/choose_source_bottomsheet.dart';
import 'package:projeto_up/utils/up_colors.dart';
import 'package:projeto_up/utils/up_config.dart';

class AppService extends GetxService {
  // TODO show onboarding

  final FirebaseStorage _storage = FirebaseStorage.instance;
  final RxBool _isImageLoading = false.obs;

  @override
  void onInit() {
    Get.put(StartupService());
    Get.put(ProjectsService());
    Get.put(UserService());
    super.onInit();
  }

  @override
  void onReady() async {
    // Coloca todas imagens em cache para que nao haja bugs visuais
    await Future.wait([
      precachePicture(
          ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/svg/fire.svg'),
          null),
      precachePicture(
          ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/svg/home.svg'),
          null),
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoder, 'assets/svg/more-horizontal.svg'),
          null),
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoder, 'assets/svg/search.svg'),
          null),
      precachePicture(
          ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/svg/up!.svg'),
          null),
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoder, 'assets/svg/align-left.svg'),
          null),
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoder, 'assets/svg/book-open.svg'),
          null),
      precachePicture(
          ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/svg/dot.svg'),
          null),
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoder, 'assets/svg/facebook.svg'),
          null),
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoder, 'assets/svg/instagram.svg'),
          null),
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoder, 'assets/svg/phone.svg'),
          null),
      precachePicture(
          ExactAssetPicture(
              SvgPicture.svgStringDecoder, 'assets/svg/linha.svg'),
          null),
      precachePicture(
          ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/svg/lock.svg'),
          null),
      precachePicture(
          ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/svg/mail.svg'),
          null),
      precacheImage(AssetImage('assets/png/foguete.png'), Get.context),
      precacheImage(AssetImage('assets/png/stars.png'), Get.context),
      precacheImage(AssetImage('assets/png/whatsapp.png'), Get.context),
      precacheImage(AssetImage('assets/png/f-button.png'), Get.context),
      precacheImage(AssetImage('assets/png/g-button.png'), Get.context),
      precacheImage(AssetImage('assets/png/start.png'), Get.context),
      precacheImage(AssetImage('assets/png/camera.png'), Get.context),
    ]);
    Get.offAllNamed(RouterService.SPLASH);

    await Future.delayed(
      Duration(seconds: UpConfig.SPLASH_TIME),
    );
    Get.offAllNamed(RouterService.HOME);
    final UserService us = Get.find();
    us.loadUser(); // Dispara o trigger daqui pois direto da stream do auth, dispara
    // prematuro, e daqui não acontece isso
    super.onReady();
  }

  void _setImageLoading(bool v) {
    _isImageLoading.value = v;
  }

  bool get isImageLoading => _isImageLoading.value;

  Future<ImageSource> getImageSource() async {
    return await Get.bottomSheet<ImageSource>(ChooseSourceBottomSheet());
  }

  Future<String> uploadImage(String userId) async {
    final ImageSource imgSource = await getImageSource();
    if (imgSource == null) {
      return null;
    }
    var pickedFile = await ImagePicker().getImage(source: imgSource);
    if (pickedFile?.path == null) {
      return null;
    }
    File sourceFile = File(pickedFile.path);

    File imgFile = await ImageCropper.cropImage(
        compressQuality: 90,
        maxHeight: 2048,
        maxWidth: 2048,
        sourcePath: sourceFile.path,
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Cortar',
          toolbarColor: UpColors.primary_dark,
          toolbarWidgetColor: Colors.white,
          hideBottomControls: true,
          lockAspectRatio: false,
          showCropGrid: true,
        ),
        iosUiSettings: IOSUiSettings(
          cancelButtonTitle: 'Cancelar',
          doneButtonTitle: 'Cortar',
          title: 'Cortar',
        ));
    if (imgFile == null) {
      return null;
    }
    _setImageLoading(true);
    Reference ref = _storage
        .ref()
        .child('users')
        .child(userId)
        .child("${getRandomString(10)}"); // Gera nome de arquivo aleatorio
    await ref.putFile(imgFile);
    String downloadUrl = await ref.getDownloadURL();
    _setImageLoading(false);
    return downloadUrl;
  }

  // copy pasta
  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
