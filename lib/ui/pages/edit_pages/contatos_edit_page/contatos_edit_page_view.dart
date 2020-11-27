import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:projeto_up/ui/components/up_button.dart';
import 'package:projeto_up/ui/components/up_edit_app_bar.dart';
import 'package:projeto_up/ui/components/up_header.dart';
import 'package:projeto_up/ui/components/up_labeled_text_field.dart';
import 'package:projeto_up/ui/components/up_text_field.dart';
import 'package:projeto_up/ui/pages/edit_pages/contatos_edit_page/contatos_edit_page_bloc.dart';
import 'package:projeto_up/utils/up_colors.dart';

class ContatosEditPageView extends GetView<ContatosEditPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UpColors.wireframe_white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          UpHeader(
            automaticallyImplyLeading: false,
          ),
          UpEditAppBar(
            text: "Contatos",
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
                  Obx(() => ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.outrosControllerList.length,
                        itemBuilder: (ctx, idx) {
                          return Obx(
                            () => Padding(
                              padding: EdgeInsets.only(bottom: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: idx == 0
                                        ? UpLabeledTextField(
                                            controller: controller
                                                .outrosControllerList[idx],
                                            topLabel: "Outros")
                                        : UpTextField(
                                            controller: controller
                                                .outrosControllerList[idx],
                                          ),
                                  ),
                                  if (controller.canAddMore() &&
                                      idx ==
                                          controller
                                                  .outrosControllerList.length -
                                              1) ...[
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: UpButton(
                                        text: "+",
                                        onTap:
                                            controller.handleAddTextController,
                                      ),
                                    ),
                                  ]
                                ],
                              ),
                            ),
                          );
                        },
                      )),
                  UpLabeledTextField(
                    controller: controller.instagramController,
                    topLabel: "Instagram",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  UpLabeledTextField(
                    controller: controller.facebookController,
                    topLabel: "Facebook",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  UpLabeledTextField(
                    controller: controller.whatsappController,
                    topLabel: "Whatsapp",
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
    );
  }
}
