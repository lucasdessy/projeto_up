import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_up/ui/components/up_header.dart';
import 'package:projeto_up/ui/pages/search_tab/components/listing.dart';
import 'package:projeto_up/ui/pages/search_tab/components/search_field.dart';
import 'package:projeto_up/ui/pages/search_tab/search_tab_bloc.dart';
import 'package:projeto_up/utils/up_colors.dart';

class SearchTabView extends GetView<SearchTabController> {
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
          SearchTabSearchField(
            controller: controller.searchController,
          ),
          controller.loading()
              ? SliverToBoxAdapter(
                  child: CupertinoActivityIndicator(),
                )
              : SearchTabListing(),
        ],
      ),
    );
  }
}
