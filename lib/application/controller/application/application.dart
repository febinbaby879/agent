import 'package:get/get.dart';

class ApplicationController extends GetxController {
  final List<String> applicationTabTitles = [
    'Total Applications',
    'New Applications',
    'Offer Letter',
    'Visa Approved'
  ];
  final List<int> tabCounts = [25, 7, 25, 16];
  String currentSortField = 'dueDate';
  bool isAscending = true;
}
