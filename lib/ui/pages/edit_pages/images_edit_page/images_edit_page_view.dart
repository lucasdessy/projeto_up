import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:projeto_up/ui/components/up_button.dart';
import 'package:projeto_up/ui/components/up_edit_app_bar.dart';
import 'package:projeto_up/ui/components/up_header.dart';
import 'package:projeto_up/ui/pages/edit_pages/images_edit_page/images_edit_page_bloc.dart';
import 'package:projeto_up/utils/up_colors.dart';

class ImagesEditPageView extends GetView<ImagesEditPageController> {
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
            text: "Álbum",
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: MediaQuery.of(context).padding.bottom + 20),
              child: Column(
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: controller.handleChoosePicture,
                      child: AspectRatio(
                        aspectRatio: 1,
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
                                  : controller.imageUrl().isNullOrBlank
                                      ? Center(
                                          child: SvgPicture.asset(
                                            'assets/svg/upload.svg',
                                            height: 40,
                                            width: 40,
                                          ),
                                        )
                                      : Image.network(
                                          controller.imageUrl(),
                                          fit: BoxFit.cover,
                                        ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  UpButton(
                    text: "Cadastrar",
                    onTap: controller.handleSaveStartup,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
