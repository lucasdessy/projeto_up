import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:projeto_up/ui/components/up_edit_app_bar.dart';
import 'package:projeto_up/ui/components/up_header.dart';
import 'package:projeto_up/ui/components/up_labeled_text_field.dart';
import 'package:projeto_up/ui/pages/edit_pages/startup_edit_page/startup_edit_page_bloc.dart';
import 'package:projeto_up/utils/up_colors.dart';
import 'package:projeto_up/utils/up_text.dart';

class StartupEditPageView extends GetView<StartupEditPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UpColors.wireframe_white,
      body: Form(
        key: controller.formKey,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            UpHeader(
              automaticallyImplyLeading: false,
            ),
            UpEditAppBar(
              text: "Editar",
              actions: [
                Container(
                  margin: EdgeInsets.only(right: 15),
                  child: IconButton(
                    icon: SvgPicture.asset('assets/svg/check.svg'),
                    onPressed: controller.handleSaveStartup,
                  ),
                )
              ],
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: MediaQuery.of(context).padding.bottom + 20),
                child: Column(
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: controller.handleChoosePicture,
                        child: Container(
                          margin: EdgeInsets.only(top: 60),
                          height: 122,
                          width: 122,
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
                                  : controller.startup()?.capaUrl == null
                                      ? Padding(
                                          padding: EdgeInsets.all(41),
                                          child: Image.asset(
                                            'assets/png/camera.png',
                                          ),
                                        )
                                      : Image.network(
                                          controller.startup().capaUrl,
                                          fit: BoxFit.cover,
                                        ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 20),
                      child: Text(
                        "Alterar Perfil",
                        style: UpText.InputTopText,
                      ),
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
                      controller: controller.descricaoController,
                      topLabel: "Descrição",
                      maxLines: 6,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
