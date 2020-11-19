import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto_up/ui/components/up_text_field.dart';
import 'package:projeto_up/utils/up_colors.dart';

class SearchTabSearchField extends StatelessWidget {
  final TextEditingController controller;

  const SearchTabSearchField({Key key, @required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: UpTextField(
          icon: SvgPicture.asset(
            'assets/svg/search.svg',
            color: UpColors.primary_dark,
          ),
          hintText: "Pesquise startups, projetos e categorias",
          controller: controller,
        ),
      ),
    );
  }
}
