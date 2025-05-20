import 'package:agent_dashboard/application/controller/home/home.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/utils/responsive/responsive.dart';
import 'package:agent_dashboard/application/presentation/widgets/container_image.dart';
import 'package:agent_dashboard/application/presentation/widgets/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductItem extends StatelessWidget {
  final int index;

  const ProductItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    //  final product = homeController.allWhishLists[index].courseId;
    return ContainerWidget(
        horizontalMargin: Responsive.isMobile(context) ? 5 : 10,
        horizontalPadding: 10,
        verticalPadding: Responsive.isMobile(context) ? 10 : 30,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ContainerImage(
                    isNetwork: true,
                    image: "",
                    width: Responsive.isMobile(context) ? 70 : 90,
                    height: Responsive.isMobile(context) ? 70 : 90,
                    fit: BoxFit.cover),
                kWidth10,
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text('name' ?? "",
                          style: textHeadStyle1,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      Text('product?.finalfee' ?? "", style: textStyle1),
                      kHeight5,
                      Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite, color: kPurple)))
                    ]))
              ])
        ]);
  }
}
