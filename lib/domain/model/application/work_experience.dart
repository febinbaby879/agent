import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class WorkExperienceItem {
  TextEditingController companyNameController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  TextEditingController companyContactNumberController =
      TextEditingController();
  TextEditingController yearOfServiceController = TextEditingController();
  RxList<File> experienceCertificates = <File>[].obs;

  Map<String, dynamic> toMap() => {
        'nameOfCompany': companyNameController.text.trim(),
        'position': positionController.text.trim(),
        'companyAddress': companyAddressController.text.trim(),
        'companyContactNumber': companyContactNumberController.text.trim(),
        'yearOfService': yearOfServiceController.text.trim()
        //  'workExperienceLetter':experienceCertificates
      };
}
