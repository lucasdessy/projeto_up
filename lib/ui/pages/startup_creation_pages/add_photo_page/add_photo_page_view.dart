import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_up/ui/components/up_button.dart';
import 'package:projeto_up/ui/components/up_header_no_sliver.dart';
import 'package:projeto_up/ui/components/up_labeled_text_field.dart';
import 'package:projeto_up/ui/pages/startup_creation_pages/add_photo_page/add_photo_page_bloc.dart';
import 'package:projeto_up/utils/up_colors.dart';

class AddPhotoPageView extends GetView<AddPhotoPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpHeaderNoSliver(),
      backgroundColor: UpColors.wireframe_white,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: controller.handleChoosePicture,
                        child: Container(
                          margin: EdgeInsets.only(top: 60),
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(180),
                            color: Color.fromARGB(255, 233, 233, 233),
                          ),
                          child: Obx(
                            () => ClipRRect(
                              borderRadius: BorderRadius.circular(180),
                              child: controller.imageLoading
                                  ? Center(
                                      child: CupertinoActivityIndicator(),
                                    )
                                  : controller.tempStartup()?.capaUrl == null
                                      ? Padding(
                                          padding: EdgeInsets.all(70),
                                          child: Image.asset(
                                            'assets/png/camera.png',
                                          ),
                                        )
                                      : Image.network(
                                          controller.tempStartup().capaUrl,
                                          fit: BoxFit.cover,
                                        ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    UpLabeledTextField(
                      controller: controller.descController,
                      topLabel: "Descrição",
                      maxLines: 6,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    UpButton(
                      text: "Confirmar",
                      onTap: controller.handleCreateStartup,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => controller.loading
                ? Container(
                    color: Colors.grey.withOpacity(0.4),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 7.8, sigmaY: 7.5),
                      child: Center(
                        child: CupertinoPopupSurface(
                          child: Container(
                            padding: EdgeInsets.all(30),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CupertinoActivityIndicator(),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                    "${controller.tempStartup().nome} está sendo criada..."),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
