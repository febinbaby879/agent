import 'package:agent_dashboard/application/controller/home.dart';
import 'package:agent_dashboard/application/presentation/screens/wishlist/widgets/product_item.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/widgets/custom_listview_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhislistDailog extends StatelessWidget {
  const WhislistDailog({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final bool isWideScreen = MediaQuery.of(context).size.width > 1000;
    return Dialog(
        backgroundColor: kWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            padding: const EdgeInsets.all(16),
            child: ListView(children: [
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop())),
              Center(child: Text('Your Wishlist', style: textHeadStyle1)),
              kHeight20,
              !isWideScreen
                  ? CustomListview(
                      separator: kHeight10,
                      scrollDirection: Axis.vertical,
                      itemCount: 4,
                      itemBuilder: ({required context, required index}) =>
                          ProductItem(index: index))
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 3,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 3,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12),
                      itemBuilder: (context, index) =>
                          ProductItem(index: index))
            ])));
  }
}
