import 'package:agent_dashboard/application/controller/application/application.dart';
import 'package:agent_dashboard/application/presentation/screens/applications/widgets/file_pick_container.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/utils/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentSubmissionSection extends StatelessWidget {
  const DocumentSubmissionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final formController = Get.find<ApplicationController>();

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context) ? 10 : 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight10,
          Text('Document Submission', style: textHeadStyle1),
          kHeight20,

          // ✅ Signed Offer Letter
          Obx(() => FilePickContainer(
                isloading: formController.pickSignedOfferLetterLoading.value,
                needMoreFiles: false,
                text: 'Upload Signed Offer Letter *',
                selectedFiles: formController.signedOfferLetterUrl,
                onTap: () => formController.pickSignedOfferLetter(),
                onRemove: (image) =>
                    formController.removeSignedOfferLetter(image),
              )),

          kHeight40,

          // ✅ Tickets
          GetBuilder<ApplicationController>(
              builder: (context) => FilePickContainer(
                    isloading: formController.pickTicketsLoading.value,
                    needMoreFiles: false,
                    text: 'Upload Tickets *',
                    selectedFiles: formController.ticketsUrl,
                    onTap: () => formController.pickpickTicketsr(),
                    onRemove: (image) => formController.removeTickets(image),
                  ))
        ],
      ),
    );
  }
}
