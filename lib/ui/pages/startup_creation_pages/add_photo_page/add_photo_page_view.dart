import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_up/ui/components/up_button.dart';
import 'package:projeto_up/ui/components/up_header_no_sliver.dart';
import 'package:projeto_up/ui/components/up_labeled_text_field.dart';
import 'package:projeto_up/ui/pages/startup_creation_pages/add_photo_page/add_photo_page_bloc.dart';
import 'package:projeto_up/utils/up_colors.dart';
import 'package:projeto_up/utils/up_network_assets.dart';

class AddPhotoPageView extends GetView<AddPhotoPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpHeaderNoSliver(),
      backgroundColor: UpColors.wireframe_white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
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
                        child: controller.tempStartup()?.capaUrl == null
                            ? Padding(
                                padding: EdgeInsets.all(70),
                                child: Image.network(
                                  UpNetworkAssets.camera,
                                ),
                              )
                            : Image.network(
                                controller.tempStartup().capaUrl,
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
    );
  }
}
