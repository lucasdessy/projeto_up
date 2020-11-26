import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:projeto_up/ui/components/up_button.dart';
import 'package:projeto_up/ui/components/up_edit_app_bar.dart';
import 'package:projeto_up/ui/components/up_header.dart';
import 'package:projeto_up/ui/components/up_labeled_text_field.dart';
import 'package:projeto_up/ui/pages/edit_pages/equipe_edit_page/equipe_edit_page_bloc.dart';
import 'package:projeto_up/utils/up_colors.dart';
import 'package:projeto_up/utils/up_text.dart';

class EquipeEditPageView extends GetView<EquipeEditPageController> {
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
              text: "Equipe",
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
                                  : controller.membro()?.fotoUrl == null
                                      ? Padding(
                                          padding: EdgeInsets.all(41),
                                          child: Image.asset(
                                            'assets/png/camera.png',
                                          ),
                                        )
                                      : Image.network(
                                          controller.membro().fotoUrl,
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
                      controller: controller.nomeController,
                      topLabel: "Nome do membro",
                      validator: (text) =>
                          text.isNullOrBlank ? "Digite o nome do membro" : null,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    UpLabeledTextField(
                      controller: controller.cargoController,
                      topLabel: "Funções",
                      validator: (text) => text.isNullOrBlank
                          ? "Digite as funções do membro"
                          : null,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    UpButton(
                      text: "Cadastrar",
                      onTap: controller.handleSaveMembro,
                    ),
                    SizedBox(
                      height: 20,
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
