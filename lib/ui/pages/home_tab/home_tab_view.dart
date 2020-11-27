import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_up/ui/components/gradient_text.dart';
import 'package:projeto_up/ui/components/up_header.dart';
import 'package:projeto_up/ui/pages/home_tab/components/listing.dart';
import 'package:projeto_up/ui/pages/home_tab/home_tab_bloc.dart';
import 'package:projeto_up/utils/up_colors.dart';

class HomeTabView extends GetView<HomeTabController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UpColors.wireframe_white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          UpHeader(),
          CupertinoSliverRefreshControl(
            onRefresh: controller.handleReload,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 20, top: 8),
              child: GradientText(
                width: 248,
                height: 60,
                text: "Olá,"
                    "\nseja bem-vindo ao up!",
              ),
            ),
          ),
          Obx(
            () => controller.loading
                ? SliverFillRemaining(
                    child: Center(child: CupertinoActivityIndicator()),
                  )
                : HomeTabListing(
                    startups: controller.startups,
                    onTap: controller.handleCardTap,
                  ),
          ),
        ],
      ),
    );
  }
}
