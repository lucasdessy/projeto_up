import 'package:flutter/material.dart';
import 'package:projeto_up/models/startup.dart';
import 'package:projeto_up/ui/pages/home_tab/components/segmento_widget.dart';

class HomeTabListing extends StatelessWidget {
  final Map<String, List<Startup>> startups;
  final Function(String) onTap;

  const HomeTabListing({Key key, @required this.startups, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: startups.length,
          itemBuilder: (ctx, idx) {
            final String _segmento = startups.keys.toList()[idx];
            final List<Startup> _startups = startups[_segmento];
            return HomeTabSegmentoWidget(
              segmento: _segmento,
              startups: _startups,
              onTap: onTap,
            );
          }),
    );
  }
}
