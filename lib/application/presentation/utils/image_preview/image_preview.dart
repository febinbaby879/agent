import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class ImagePreviewDialog extends StatelessWidget {
  const ImagePreviewDialog({super.key, required this.imageProvider});

  final ImageProvider<Object>? imageProvider;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: const EdgeInsets.all(16.0),
        backgroundColor: kWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        child: SizedBox(
            height: 450,
            width:
                MediaQuery.of(context).size.width > 600 ? 350 : double.infinity,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop())),
              kHeight30,
              Container(
                  margin: const EdgeInsets.all(3),
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(3),
                      image: DecorationImage(
                          image: imageProvider!, fit: BoxFit.contain)))
            ])));
  }
}

void showImagePreviewDialog(
    BuildContext context, ImageProvider<Object> imageProvider) {
  showDialog(
      context: context,
      builder: (context) => ImagePreviewDialog(imageProvider: imageProvider));
}
