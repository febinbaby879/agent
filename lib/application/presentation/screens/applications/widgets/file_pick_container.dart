import 'dart:developer';

import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/utils/image_preview/image_preview.dart';
import 'package:agent_dashboard/application/presentation/widgets/container_widget.dart';
import 'package:agent_dashboard/application/presentation/widgets/event_button.dart';
import 'package:agent_dashboard/domain/model/image/image_model.dart';
import 'package:flutter/material.dart';

class FilePickContainer extends StatelessWidget {
  const FilePickContainer(
      {super.key,
      this.onTap,
      required this.text,
      this.selectedFiles,
      this.onRemove,
      this.needMoreFiles = false,
      this.onUpdate,
      required this.isloading});

  final VoidCallback? onTap;
  final String text;
  final List<ImageModel?>? selectedFiles;
  final Function(ImageModel)? onRemove;
  final bool needMoreFiles;
  final Function(ImageModel)? onUpdate;
  final bool isloading;

  @override
  Widget build(BuildContext context) {
    log(isloading.toString());
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      text == '' ? kEmpty : Text(text, style: textThinStyle1),
      kHeight5,
      if (isloading)
        Container(
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(8)),
            child: Center(child: CircularProgressIndicator(color: kpurple400)))
      else if (selectedFiles != null && selectedFiles!.isNotEmpty)
        Column(
            children: selectedFiles!
                .map((file) => Stack(children: [
                      _buildFilePreview(file!, context),
                      Positioned(
                          top: 20,
                          right: 10,
                          child: InkWell(
                              onTap: () => onRemove?.call(file),
                              child: CircleAvatar(
                                  radius: 17,
                                  backgroundColor: kWhite.withOpacity(.6),
                                  child: const Icon(
                                      Icons.delete_forever_outlined,
                                      color: kRed,
                                      size: 20))))
                    ]))
                .toList())
      else
        ContainerWidget(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            width: double.infinity,
            height: 100,
            onTap: onTap,
            children: [
              Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Icon(Icons.cloud_upload_outlined, size: 40, color: kPurple),
                    Text('Click here to Upload', style: textThinStyle1)
                  ]))
            ]),
      kHeight10,
      needMoreFiles
          ? EventButton(
              hieght: 30,
              width: 120,
              style: textHeadStyle1.copyWith(color: kWhite, fontSize: 12),
              text: 'Add More Files',
              onTap: onTap ?? () {},
              borderColor: kPurple,
              color: kPurple)
          : kEmpty
    ]);
  }

  Widget _buildFilePreview(ImageModel file, BuildContext context) {
    if (file.type == 'pdf') {
      return _buildPdfPreview(file, context);
    } else {
      return _buildImagePreview(file, context);
    }
  }

  Widget _buildImagePreview(ImageModel image, BuildContext context) {
    ImageProvider imageProvider;

    if (image.webImage != null) {
      // Use MemoryImage for web (Uint8List)
      imageProvider = MemoryImage(image.webImage!);
    } else if (image.fileImage != null) {
      // Use FileImage for mobile (File)
      imageProvider = FileImage(image.fileImage!);
    } else {
      return kEmpty;
    }
    return GestureDetector(
      onTap: () => showImagePreviewDialog(context, imageProvider),
      child: Container(
          margin: const EdgeInsets.only(top: 10),
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover))),
    );
  }

  Widget _buildPdfPreview(ImageModel pdf, BuildContext context) =>
      GestureDetector(
          // onTap: () => showDialog(
          //       context: context,
          //       builder: (context) => PDFViewerScreen(
          //           source: pdf.base64 ?? "", fileName: "PDF", isBase64: true),
          //     ),
          child: Container(
              width: double.infinity,
              height: 100,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: kRadius10,
                  color: Colors.grey[200]),
              child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.picture_as_pdf, size: 70, color: kRed)
                  ])));
}
