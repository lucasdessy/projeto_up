import 'package:flutter/material.dart';
import 'package:projeto_up/ui/pages/search_tab/components/search_result_card.dart';

class SearchTabListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (ctx, idx) {
          return SearchTabSearchResultCars();
        },
      ),
    );
  }
}
