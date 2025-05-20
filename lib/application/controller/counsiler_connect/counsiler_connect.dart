import 'package:agent_dashboard/domain/model/counsiller_connect/counsiller_connect_request_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounsillerController extends GetxController {
  RxBool addRequestLoading = false.obs;
  RxList cancelRequestLoadingList = [].obs;
  RxBool cancelRequestLoading = false.obs;
  RxBool getRequestListLoading = false.obs;
  RxBool showRequestDetail = false.obs;
  RxBool showRequestForm = false.obs;
  // Form values
  final formKey = GlobalKey<FormState>();
  final descriptionController = TextEditingController();
  RxString selectedRequestType = "Meeting".obs;
  List<String> requestTypes = ['Meeting', 'Training', 'Call'];
  RxString selectedFilter = "All".obs;
  List<String> filters = ['All', 'Requested', 'In Progress', 'Completed'];
  Rx<CounsillerConnectRequestModel?> selectedRequest =
      CounsillerConnectRequestModel().obs;

  final RxList<CounsillerConnectRequestModel> requests = _requestsList.obs;

  /// status filter
  void changeStatusFilter(String value) {
    selectedFilter.value = value;
    if (value == 'All') {
      requests.value = _requestsList;
    } else {
      requests.value = _requestsList.where((e) => e.status == value).toList();
    }
  }

  /// change selected request type
  void changeSelectedRequestType(String value) {
    selectedRequestType.value = value;
  }

  /// get request details
  void getRequestDetails(CounsillerConnectRequestModel request) {
    selectedRequest.value = request;
    showDetail(true);
    showRequestFormUi(false);
  }

  /// show request detail or request add
  /// [true] for detail [false] for add page
  void showDetail(bool value) {
    showRequestDetail.value = value;
    if (!value) {
      selectedRequest.value = CounsillerConnectRequestModel();
      showRequestFormUi(false);
    }
  }

  void showRequestFormUi(bool value) {
    showRequestForm.value = value;
  }

  /// send new request
  void sendRequest() async {
    if (addRequestLoading.value) return;
    if (formKey.currentState?.validate() ?? false) {
      addRequestLoading.value = true;
      await Future.delayed(const Duration(seconds: 2));
      descriptionController.text = '';
      addRequestLoading.value = false;
    }
  }

  /// canecel request
  void cancelRequest(CounsillerConnectRequestModel request) async {
    if (cancelRequestLoadingList.contains(request.id)) return;
    cancelRequestLoading.value = true;
    cancelRequestLoadingList.add(request.id);
    await Future.delayed(const Duration(seconds: 2));
    descriptionController.text = '';
    cancelRequestLoadingList.remove(request.id);
    if (cancelRequestLoadingList.isEmpty) {
      cancelRequestLoading.value = false;
    }
  }
}

final _requestsList = [
  CounsillerConnectRequestModel(
    id: "REQ-001",
    type: "Meeting",
    description: "Discuss quarterly goals with the management team",
    requestedDate: DateTime.now().subtract(const Duration(days: 5)),
    status: "In Progress",
  ),
  CounsillerConnectRequestModel(
    id: "REQ-002",
    type: "Training",
    description: "Flutter advanced course for development team",
    requestedDate: DateTime.now().subtract(const Duration(days: 2)),
    status: "Requested",
  ),
  CounsillerConnectRequestModel(
    id: "REQ-003",
    type: "Call",
    description: "Client call regarding new project requirements",
    requestedDate: DateTime.now().subtract(const Duration(days: 10)),
    status: "Completed",
  ),
  CounsillerConnectRequestModel(
    id: "REQ-004",
    type: "Meeting",
    description: "Weekly team standup",
    requestedDate: DateTime.now().subtract(const Duration(days: 1)),
    status: "Requested",
  ),
  CounsillerConnectRequestModel(
    id: "REQ-005",
    type: "Training",
    description: "New hiring orientation",
    requestedDate: DateTime.now().subtract(const Duration(days: 15)),
    status: "Completed",
  ),
];
