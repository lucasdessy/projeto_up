import 'package:flutter/material.dart';
import 'package:projeto_up/models/startup.dart';
import 'package:projeto_up/ui/pages/home_page/components/segmento_widget.dart';

class HomePageListing extends StatelessWidget {
  final Map<String, List<Startup>> startups;

  const HomePageListing({Key key, @required this.startups}) : super(key: key);

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
            return HomePageSegmentoWidget(
              segmento: _segmento,
              startups: _startups,
            );
          }),
    );
  }
}
