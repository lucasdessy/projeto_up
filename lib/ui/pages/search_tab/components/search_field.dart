import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto_up/utils/up_colors.dart';
import 'package:projeto_up/utils/up_text.dart';

class SearchTabSearchField extends StatelessWidget {
  final TextEditingController controller;

  const SearchTabSearchField({Key key, @required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          controller: controller,
          style: UpText.SearchFieldActive,
          decoration: InputDecoration(
            hintText: "Pesquise startups, projetos e categorias",
            prefixIconConstraints: BoxConstraints.expand(height: 20, width: 43),
            prefixIcon: Padding(
              padding: EdgeInsets.only(),
              child: SvgPicture.asset(
                'assets/svg/search.svg',
                color: UpColors.primary_dark,
              ),
            ),
            focusedBorder: InputBorder.none,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 247, 247, 247)),
            ),
            fillColor: Color.fromARGB(255, 247, 247, 247),
            filled: true,
            hintStyle: UpText.SearchField,
          ),
        ),
      ),
    );
  }
}
