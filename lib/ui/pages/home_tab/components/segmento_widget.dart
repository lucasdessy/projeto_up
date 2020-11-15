import 'package:flutter/material.dart';
import 'package:projeto_up/models/startup.dart';
import 'package:projeto_up/ui/pages/home_tab/components/startup_card.dart';
import 'package:projeto_up/utils/up_text.dart';

class HomeTabSegmentoWidget extends StatelessWidget {
  final String segmento;
  final List<Startup> startups;
  final Function(String) onTap;
  const HomeTabSegmentoWidget(
      {Key key,
      @required this.segmento,
      @required this.startups,
      @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 20,
          ),
          child: Text(
            "$segmento",
            style: UpText.Segment,
          ),
        ),
        SizedBox(
          height: 14,
        ),
        SizedBox(
          height: 175,
          child: ListView.builder(
              itemCount: startups.length,
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, idx) {
                final Startup _startup = startups[idx];
                return HomeTabStartupCard(
                  startup: _startup,
                  onTap: onTap,
                );
              }),
        ),
      ],
    );
  }
}
