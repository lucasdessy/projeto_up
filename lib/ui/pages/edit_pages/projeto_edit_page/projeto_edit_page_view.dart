import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:projeto_up/ui/components/up_button.dart';
import 'package:projeto_up/ui/components/up_edit_app_bar.dart';
import 'package:projeto_up/ui/components/up_header.dart';
import 'package:projeto_up/ui/components/up_labeled_text_field.dart';
import 'package:projeto_up/ui/pages/edit_pages/projeto_edit_page/projeto_edit_page_bloc.dart';
import 'package:projeto_up/utils/up_colors.dart';
import 'package:projeto_up/utils/up_text.dart';

class ProjetoEditPageView extends GetView<ProjetoEditPageController> {
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
                text: "Projeto",
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: MediaQuery.of(context).padding.bottom + 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          "Capa",
                          style: UpText.InputTopText,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: controller.handleChoosePicture,
                          child: Container(
                            height: 120,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromARGB(255, 247, 247, 247),
                            ),
                            child: Obx(
                              () => ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: controller.imageLoading
                                    ? Center(
                                        child: CupertinoActivityIndicator(),
                                      )
                                    : controller.projeto()?.capaUrl == null
                                        ? Padding(
                                            padding: EdgeInsets.all(41),
                                            child: SvgPicture.asset(
                                              'assets/svg/upload.svg',
                                              height: 40,
                                              width: 40,
                                            ),
                                          )
                                        : Image.network(
                                            controller.projeto().capaUrl,
                                            fit: BoxFit.cover,
                                          ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      UpLabeledTextField(
                        controller: controller.nomeController,
                        topLabel: "Nome do Projeto",
                        validator: (text) => text.isNullOrBlank
                            ? "Digite o nome do projeto"
                            : null,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      UpLabeledTextField(
                        controller: controller.descController,
                        topLabel: "Descrição",
                        maxLines: 6,
                        validator: (text) => text.isNullOrBlank
                            ? "Digite uma descrição para o projeto"
                            : null,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      UpButton(
                        text: "Cadastrar",
                        onTap: controller.handleSaveProjeto,
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
        ));
  }
}
