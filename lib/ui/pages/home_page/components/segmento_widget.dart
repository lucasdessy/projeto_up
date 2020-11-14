import 'package:flutter/material.dart';
import 'package:projeto_up/models/startup.dart';
import 'package:projeto_up/ui/pages/home_page/components/startup_card.dart';
import 'package:projeto_up/utils/up_text.dart';

class HomePageSegmentoWidget extends StatelessWidget {
  final String segmento;
  final List<Startup> startups;

  const HomePageSegmentoWidget(
      {Key key, @required this.segmento, @required this.startups})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$segmento",
            style: UpText.Segment,
          ),
          SizedBox(
            height: 14,
          ),
          SizedBox(
            height: 175,
            child: ListView.builder(
                itemCount: startups.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, idx) {
                  final Startup _startup = startups[idx];
                  return HomePageStartupCard(
                    startup: _startup,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
