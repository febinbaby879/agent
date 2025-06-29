import 'package:agent_dashboard/application/controller/application/application.dart';
import 'package:agent_dashboard/application/presentation/screens/applications/widgets/file_pick_container.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/utils/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QualificationFilesDetails extends StatelessWidget {
  const QualificationFilesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final formController = Get.find<ApplicationController>();
    final bool isWideScreen = MediaQuery.of(context).size.width > 1000;
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.isMobile(context) ? 10 : 50),
        child: !isWideScreen
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                kHeight10,
                Text('Documents & Other Details', style: textHeadStyle1),
                kHeight20,
                Text(
                    'Please attach clear copies of the documents asked in this section.',
                    style: textHeadStyle1.copyWith(fontSize: 14)),
                kHeight20,
                Obx(() => FilePickContainer(
                    isloading: formController.pickPassportImagesloading.value,
                    needMoreFiles:
                        (formController.passportImagesFront.length == 1)
                            ? true
                            : false,
                    text: 'Passport Front Side Copy *',
                    selectedFiles: formController.passportImagesFront,
                    onTap: () => formController.pickPassportImages(),
                    onRemove: (image) => formController.removeImage(image))),
                kHeight5,
                GetBuilder<ApplicationController>(
                    builder: (contro) => FilePickContainer(
                        isloading: contro.pickPassportImagesBackloading.value,
                        //  onUpdate: (p0) => formController.updatePassportSizePhoto(),
                        needMoreFiles:
                            (formController.passportImagesBack.length == 1)
                                ? false
                                : false,
                        onTap: () => formController.pickPassportBackImages(),
                        onRemove: (image) =>
                            formController.removePassportBackImage(image),
                        selectedFiles: formController.passportImagesBack,
                        text: 'Passport Back Side Copy *')),
                kHeight15,
                GetBuilder<ApplicationController>(
                    builder: (contro) => FilePickContainer(
                        isloading: contro.pickPasspoertSizePhotoloading.value,
                        //  onUpdate: (p0) => formController.updatePassportSizePhoto(),
                        needMoreFiles:
                            (formController.passportSizePhoto.length == 1)
                                ? false
                                : false,
                        onTap: () => formController.pickPasspoertSizePhoto(),
                        onRemove: (image) =>
                            formController.removePassportSizePhoto(image),
                        selectedFiles: formController.passportSizePhoto,
                        text:
                            'Passport Size Photo (With white background) (JPG 500 kb only)*')),
                kHeight10,
                GetBuilder<ApplicationController>(
                    builder: (controller) => FilePickContainer(
                        isloading: controller
                            .pickHighestQualificationCertificateloading.value,
                        selectedFiles:
                            formController.highestQualificationCertificate,
                        onTap: () => formController
                            .pickHighestQualificationCertificate(),
                        onRemove: (image) => formController
                            .removeHighestQualificationCertificate(image),
                        needMoreFiles:
                            (formController.passportImagesFront.length == 1)
                                ? false
                                : false,
                        text:
                            'Certificate of Current or Highest Qualification*')),
                kHeight10,
                GetBuilder<ApplicationController>(
                    builder: (controller) => FilePickContainer(
                        isloading:
                            controller.pickMastersCertificateloading.value,
                        selectedFiles: formController.mastersCertificate,
                        text: 'Master\'s Certificate (if applicable)',
                        needMoreFiles:
                            (formController.passportImagesFront.length == 1)
                                ? false
                                : false,
                        onTap: () => formController.pickMastersCertificate(),
                        onRemove: (image) =>
                            formController.removeMastersCertificate(image))),
                kHeight10,
                GetBuilder<ApplicationController>(
                    builder: (controller) => FilePickContainer(
                        isloading:
                            controller.pickBachlersCertificateloading.value,
                        selectedFiles: formController.bachelorsCertificate,
                        needMoreFiles:
                            (formController.passportImagesFront.length == 1)
                                ? false
                                : false,
                        onTap: () => formController.pickBachlersCertificate(),
                        onRemove: (image) =>
                            formController.removeBachlersCertificate(image),
                        text: 'Bachelor\'s Certificate (if applicable)')),
                kHeight10,
                GetBuilder<ApplicationController>(
                    builder: (controller) => FilePickContainer(
                        isloading:
                            controller.pickPlusTwoCertificateloading.value,
                        selectedFiles: formController.plustTwoALevelCertificate,
                        text: '+2 / A Level Certificate*',
                        needMoreFiles:
                            (formController.passportImagesFront.length == 1)
                                ? false
                                : false,
                        onTap: () => formController.pickPlusTwoCertificate(),
                        onRemove: (image) =>
                            formController.removePlusTwoCertificate(image))),
                kHeight10,
                GetBuilder<ApplicationController>(
                    builder: (controller) => FilePickContainer(
                        isloading: controller.pickTenthCertificatloading.value,
                        selectedFiles: formController.tenthALevelCertificate,
                        text: '10 th / O Level Certificate*',
                        needMoreFiles:
                            (formController.passportImagesFront.length == 1)
                                ? false
                                : false,
                        onTap: () => formController.pickTenthCertificate(),
                        onRemove: (image) =>
                            formController.removeTenthCertificate(image))),
                kHeight10,
                GetBuilder<ApplicationController>(
                    builder: (controller) => FilePickContainer(
                        isloading: controller.pickCVCertificateloading.value,
                        selectedFiles: formController.academicCVCertificate,
                        needMoreFiles:
                            (formController.passportImagesFront.length == 1)
                                ? false
                                : false,
                        onTap: () => formController.pickCVCertificate(),
                        onRemove: (image) =>
                            formController.removeCVCertificate(image),
                        text: 'Academic CV (Please upload Academic CV)*'))
              ])
            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                kHeight10,
                Text('Documents & Other Details', style: textHeadStyle1),
                kHeight40,
                Row(children: [
                  Obx(() => Expanded(
                        child: FilePickContainer(
                            isloading:
                                formController.pickPassportImagesloading.value,
                            needMoreFiles:
                                (formController.passportImagesFront.length == 1)
                                    ? true
                                    : false,
                            text: 'Passport Front Side Copy',
                            selectedFiles: formController.passportImagesFront,
                            onTap: () => formController.pickPassportImages(),
                            onRemove: (image) =>
                                formController.removeImage(image)),
                      )),
                  kWidth50,
                  GetBuilder<ApplicationController>(
                      builder: (contro) => Expanded(
                            child: FilePickContainer(
                                isloading:
                                    contro.pickPassportImagesBackloading.value,
                                needMoreFiles:
                                    (formController.passportImagesBack.length ==
                                            1)
                                        ? false
                                        : false,
                                onTap: () =>
                                    formController.pickPassportBackImages(),
                                onRemove: (image) => formController
                                    .removePassportBackImage(image),
                                selectedFiles:
                                    formController.passportImagesBack,
                                text: 'Passport Back Side Copy *'),
                          )),
                ]),
                kHeight40,
                Row(children: [
                  GetBuilder<ApplicationController>(
                      builder: (controller) => Expanded(
                          child: FilePickContainer(
                              isloading: controller
                                  .pickHighestQualificationCertificateloading
                                  .value,
                              selectedFiles: formController
                                  .highestQualificationCertificate,
                              onTap: () => formController
                                  .pickHighestQualificationCertificate(),
                              onRemove: (image) => formController
                                  .removeHighestQualificationCertificate(image),
                              needMoreFiles:
                                  (formController.passportImagesFront.length ==
                                          1)
                                      ? false
                                      : false,
                              text:
                                  'Certificate of Current or Highest Qualification*'))),
                  kWidth50,
                  GetBuilder<ApplicationController>(
                      builder: (controller) => Expanded(
                          child: FilePickContainer(
                              isloading: controller
                                  .pickMastersCertificateloading.value,
                              selectedFiles: formController.mastersCertificate,
                              text: 'Master\'s Certificate (if applicable)',
                              needMoreFiles:
                                  (formController.passportImagesFront.length ==
                                          1)
                                      ? false
                                      : false,
                              onTap: () =>
                                  formController.pickMastersCertificate(),
                              onRemove: (image) => formController
                                  .removeMastersCertificate(image))))
                ]),
                kHeight40,
                Row(children: [
                  GetBuilder<ApplicationController>(
                      builder: (controller) => Expanded(
                          child: FilePickContainer(
                              isloading: controller
                                  .pickBachlersCertificateloading.value,
                              selectedFiles:
                                  formController.bachelorsCertificate,
                              needMoreFiles:
                                  (formController.passportImagesFront.length ==
                                          1)
                                      ? false
                                      : false,
                              onTap: () =>
                                  formController.pickBachlersCertificate(),
                              onRemove: (image) => formController
                                  .removeBachlersCertificate(image),
                              text:
                                  'Bachelor\'s Certificate (if applicable)'))),
                  kWidth50,
                  GetBuilder<ApplicationController>(
                      builder: (controller) => Expanded(
                          child: FilePickContainer(
                              isloading: controller
                                  .pickPlusTwoCertificateloading.value,
                              selectedFiles:
                                  formController.plustTwoALevelCertificate,
                              text: '+2 / A Level Certificate*',
                              needMoreFiles:
                                  (formController.passportImagesFront.length ==
                                          1)
                                      ? false
                                      : false,
                              onTap: () =>
                                  formController.pickPlusTwoCertificate(),
                              onRemove: (image) => formController
                                  .removePlusTwoCertificate(image))))
                ]),
                kHeight40,
                Row(children: [
                  GetBuilder<ApplicationController>(
                      builder: (controller) => Expanded(
                            child: FilePickContainer(
                                isloading:
                                    controller.pickTenthCertificatloading.value,
                                selectedFiles:
                                    formController.tenthALevelCertificate,
                                text: '10 th / O Level Certificate*',
                                needMoreFiles: (formController
                                            .passportImagesFront.length ==
                                        1)
                                    ? false
                                    : false,
                                onTap: () =>
                                    formController.pickTenthCertificate(),
                                onRemove: (image) => formController
                                    .removeTenthCertificate(image)),
                          )),
                  kWidth50,
                  GetBuilder<ApplicationController>(
                      builder: (controller) => Expanded(
                            child: FilePickContainer(
                                isloading:
                                    controller.pickCVCertificateloading.value,
                                selectedFiles:
                                    formController.academicCVCertificate,
                                needMoreFiles: (formController
                                            .passportImagesFront.length ==
                                        1)
                                    ? false
                                    : false,
                                onTap: () => formController.pickCVCertificate(),
                                onRemove: (image) =>
                                    formController.removeCVCertificate(image),
                                text:
                                    'Academic CV (Please upload Academic CV)*'),
                          ))
                ]),
                kHeight40,
                GetBuilder<ApplicationController>(
                    builder: (contro) => FilePickContainer(
                        isloading: contro.pickPasspoertSizePhotoloading.value,
                        //  onUpdate: (p0) => formController.updatePassportSizePhoto(),
                        needMoreFiles:
                            (formController.passportImagesFront.length == 1)
                                ? false
                                : false,
                        onTap: () => formController.pickPasspoertSizePhoto(),
                        onRemove: (image) =>
                            formController.removePassportSizePhoto(image),
                        selectedFiles: formController.passportSizePhoto,
                        text:
                            'Passport Size Photo (With white background) (JPG 500 kb only)*'))
              ]));
  }
}
