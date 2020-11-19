import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_up/ui/components/gradient_text.dart';
import 'package:projeto_up/ui/components/up_button.dart';
import 'package:projeto_up/ui/components/up_header_no_sliver.dart';
import 'package:projeto_up/ui/components/up_labeled_text_field.dart';
import 'package:projeto_up/ui/pages/startup_creation_pages/welcome_page/welcome_page_bloc.dart';
import 'package:projeto_up/utils/up_colors.dart';
import 'package:projeto_up/utils/up_text.dart';

class WelcomePageView extends GetView<WelcomePageController> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => GradientText(
                      width: Get.width - 40,
                      height: 54,
                      text: controller.startupText()),
                ),
                Text(
                  "Para começar preencha as seguintes informações",
                  style: UpText.WelcomeSubtitleText,
                ),
                SizedBox(
                  height: 20,
                ),
                UpLabeledTextField(
                  controller: controller.startupController,
                  topLabel: "Nome da startup *",
                  validator: (text) =>
                      text.isNullOrBlank ? "*Campo obrigatório" : null,
                ),
                SizedBox(
                  height: 20,
                ),
                UpLabeledTextField(
                  controller: controller.segmentoController,
                  topLabel: "Segmento *",
                  validator: (text) =>
                      text.isNullOrBlank ? "*Campo obrigatório" : null,
                ),
                SizedBox(
                  height: 20,
                ),
                UpLabeledTextField(
                  controller: controller.instagramController,
                  topLabel: "Instagram",
                ),
                SizedBox(
                  height: 20,
                ),
                UpLabeledTextField(
                  controller: controller.faceBookController,
                  topLabel: "Facebook",
                ),
                SizedBox(
                  height: 20,
                ),
                UpLabeledTextField(
                  controller: controller.whatsAppController,
                  topLabel: "Whatsapp",
                ),
                SizedBox(
                  height: 20,
                ),
                UpButton(
                  text: "Próximo",
                  onTap: controller.handleGoToNextPage,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
