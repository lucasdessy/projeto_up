import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:projeto_up/ui/components/up_edit_app_bar.dart';
import 'package:projeto_up/ui/components/up_header.dart';
import 'package:projeto_up/ui/pages/edit_pages/projeto_edit_page/projeto_edit_page_bloc.dart';
import 'package:projeto_up/utils/up_colors.dart';

class ProjetoEditPageView extends GetView<ProjetoEditPageController> {
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
            text: "Projeto",
          ),
        ],
      ),
    );
  }
}
