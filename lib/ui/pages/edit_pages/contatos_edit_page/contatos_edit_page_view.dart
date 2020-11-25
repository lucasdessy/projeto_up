import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_up/ui/components/up_edit_app_bar.dart';
import 'package:projeto_up/ui/components/up_header.dart';
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
          ),
        ],
      ),
    );
  }
}
