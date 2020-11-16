import 'package:flutter/material.dart';
import 'package:projeto_up/ui/pages/search_tab/components/search_result_card.dart';

class SearchTabListing extends StatelessWidget {
  final List<dynamic> projectsStartupsList;
  final Function(String) onTap;
  const SearchTabListing(
      {Key key, @required this.projectsStartupsList, @required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: projectsStartupsList.length,
        itemBuilder: (ctx, idx) {
          return SearchTabSearchResultCard(
            startupOrProject: projectsStartupsList[idx],
            onTap: onTap,
          );
        },
      ),
    );
  }
}
