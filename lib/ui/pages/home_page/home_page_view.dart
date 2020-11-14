import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_up/ui/components/up_header.dart';
import 'package:projeto_up/ui/pages/home_page/components/greetings.dart';
import 'package:projeto_up/ui/pages/home_page/components/listing.dart';
import 'package:projeto_up/ui/pages/home_page/home_page_bloc.dart';

class HomePageView extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          UpHeader(),
          HomePageGreetings(),
          HomePageListing(),
        ],
      ),
    );
  }
}
