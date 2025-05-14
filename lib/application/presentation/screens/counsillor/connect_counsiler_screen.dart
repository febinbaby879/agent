import 'package:agent_dashboard/application/controller/counsiler_connect.dart';
import 'package:agent_dashboard/application/presentation/utils/animations/hover_effect.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/widgets/text_form_field.dart';
import 'package:agent_dashboard/domain/model/counsiller_connect/counsiller_connect_request_model.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnlineCounsellorContent extends StatefulWidget {
  const OnlineCounsellorContent({super.key});

  @override
  State<OnlineCounsellorContent> createState() =>
      _OnlineCounsellorContentState();
}

class _OnlineCounsellorContentState extends State<OnlineCounsellorContent> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CounsillerController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kpurple400,
        title: const Text(
          'Connect Counsellor',
          style: TextStyle(color: kWhite),
        ),
        centerTitle: false,
        actions: [
          HoverEffectWidget(
            child: IconButton(
              icon: const Icon(Icons.refresh, color: kWhite),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Responsive layout
          if (constraints.maxWidth < 600) {
            // Mobile layout
            return Obx(
              () => Stack(
                children: [
                  Column(
                    children: [
                      kHeight10,
                      if (!controller.showRequestDetail.value &&
                          !controller.showRequestForm.value)
                        _buildFilterBar(controller, showDropdown: true),
                      Expanded(
                          child: controller.showRequestForm.value
                              ? _buildRequestForm(controller, true)
                              : controller.selectedRequest.value?.id == null ||
                                      !controller.showRequestDetail.value
                                  ? _buildRequestsList(controller,
                                      mobile: true, constraints: constraints)
                                  : _buildRequestDetails(controller,
                                      controller.selectedRequest.value!)),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Obx(
                      () => controller.showRequestForm.value
                          ? const SizedBox.shrink()
                          : Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, bottom: 20),
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.showRequestFormUi(true);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: kpurple400,
                                    foregroundColor: kWhite),
                                child: const Icon(Icons.add),
                              ),
                            ),
                    ),
                  )
                ],
              ),
            );
          } else {
            // Desktop/tablet layout (side by side)
            return Column(
              children: [
                _buildFilterBar(controller),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left panel - Requests List
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          width: constraints.maxWidth * 0.35,
                          child: _buildRequestsList(controller,
                              constraints: constraints),
                        ),
                      ),
                      // Vertical divider
                      Container(
                        width: 1,
                        color: Colors.grey[300],
                      ),
                      // Right panel - Request Form or Details
                      Expanded(
                        flex: 3,
                        child: SingleChildScrollView(
                          child: Obx(
                            () => Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: controller.showRequestDetail.value
                                  ? _buildRequestDetails(controller,
                                      controller.selectedRequest.value!)
                                  : _buildRequestForm(controller),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildFilterBar(CounsillerController controller,
      {bool showDropdown = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      color: Colors.grey[100],
      child: Obx(
        () => Row(
          children: [
            const Text('Filter: ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(width: 8),
            if (showDropdown) const Spacer(),
            if (showDropdown)
              DropdownButton<String>(
                value: controller.selectedFilter.value,
                onChanged: (value) {
                  if (value != null) {
                    controller.changeStatusFilter(value);
                  }
                },
                items: controller.filters
                    .map((filter) => DropdownMenuItem(
                          value: filter,
                          child: Text(filter),
                        ))
                    .toList(),
              )
            else
              ...List.generate(
                controller.filters.length,
                (index) {
                  final data = controller.filters[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: HoverEffectWidget(
                      child: ChoiceChip(
                        backgroundColor: kpurple400!.withOpacity(0.1),
                        label: Text(data),
                        selected: controller.selectedFilter.value == data,
                        onSelected: (selected) {
                          controller.changeStatusFilter(data);
                        },
                      ),
                    ),
                  );
                },
              )
          ],
        ),
      ),
    );
  }

  Widget _buildRequestsList(CounsillerController controller,
      {bool mobile = false, required BoxConstraints constraints}) {
    // final showTrailing = mobile || constraints.maxWidth < 600;
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Requests (${controller.requests.length})',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: controller.getRequestListLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.requests.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.list_alt,
                                size: 64, color: Colors.grey[400]),
                            const SizedBox(height: 16),
                            Text(
                              'No .selectedFilter requests found',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      )
                    : ListView.separated(
                        itemCount: controller.requests.length,
                        separatorBuilder: (context, index) =>
                            const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final request = controller.requests[index];
                          return HoverEffectWidget(
                            child: ListTile(
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${request.type} Request',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // if (showTrailing)
                                  Text(
                                    '(${request.status})',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          _getStatusColor(request.status ?? ""),
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${(request.description?.length ?? 0) > 60 ? (request.description?.substring(0, 60) ?? '') + '...' : request.description}\n${_formatDate(DateTime.now())}',
                                  ),
                                ],
                              ),
                              isThreeLine: true,
                              leading: _getLeadingIcon(request.type ?? ''),
                              // trailing:
                              //     !showTrailing ? _trailingStatus(request) : null,
                              selected: controller.selectedRequest.value?.id ==
                                  request.id,
                              selectedTileColor: Colors.blue[50],
                              onTap: () {
                                controller.getRequestDetails(request);
                              },
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }

  Widget _buildRequestForm(CounsillerController controller,
      [bool showBackButton = false]) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (showBackButton)
                IconButton(
                    onPressed: () {
                      controller.showRequestFormUi(false);
                    },
                    icon: const Icon(Icons.arrow_back)),
              if (showBackButton) kWidth10,
              const Text(
                'Create New Request',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Request Type Selection
          const Text(
            'Request Type',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Obx(
            () => HoverEffectWidget(
              child: SegmentedButton<String>(
                style: ButtonStyle(
                    side:
                        WidgetStatePropertyAll(BorderSide(color: kpurple400!))),
                emptySelectionAllowed: false,
                multiSelectionEnabled: false,
                segments: const [
                  ButtonSegment(
                    value: 'Meeting',
                    label: Text('Meeting'),
                    icon: Icon(Icons.meeting_room),
                  ),
                  ButtonSegment(
                    value: 'Call',
                    label: Text('Call'),
                    icon: Icon(Icons.phone),
                  ),
                  ButtonSegment(
                    value: 'Training',
                    label: Text('Training'),
                    icon: Icon(Icons.school),
                  ),
                ],
                selected: {controller.selectedRequestType.value},
                onSelectionChanged: (Set<String> newSelection) {
                  controller.changeSelectedRequestType(newSelection.first);
                },
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Description Field
          const Text(
            'Description',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          CustomTextField(
            controller: controller.descriptionController,
            maxLines: 5,
            hintText: 'Please describe why you are requesting this...',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a description';
              }
              if (value.length < 10) {
                return 'Description should be at least 10 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 32),

          // Submit Button
          SizedBox(
            width: double.infinity,
            child: Obx(() => HoverEffectWidget(
                  child: ElevatedButton.icon(
                    icon: ShakeX(
                        animate: controller.addRequestLoading.value,
                        child: const Icon(Icons.send)),
                    label: Text(controller.addRequestLoading.value
                        ? ' Requesting ...'
                        : 'Submit Request'),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: kRadius5),
                        padding: const EdgeInsets.all(16),
                        backgroundColor: kpurple400,
                        foregroundColor: kWhite),
                    onPressed: () {
                      controller.sendRequest();
                    },
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildRequestDetails(
      CounsillerController controller, CounsillerConnectRequestModel request) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  controller.showDetail(false);
                },
                icon: const Icon(Icons.arrow_back)),
            kWidth20,
            Text(
              '${request.type} Request',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            _getLeadingIcon(request.type ?? "", size: 32),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   '${request.type} Request',
                  //   style: const TextStyle(
                  //     fontSize: 24,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  Text(
                    '• ID: ${request.id}',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            Chip(
              label: Text(
                request.status ?? '',
                style: TextStyle(
                  color: _getStatusColor(request.status ?? ''),
                ),
              ),
              backgroundColor:
                  _getStatusColor(request.status ?? '').withOpacity(0.1),
            ),
          ],
        ),
        const SizedBox(height: 32),
        Text(
          '• Requested on : ${_formatDate(DateTime.now())}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        kHeight10,
        const Text(
          '• Description',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Text(request.description ?? ''),
        ),
        const SizedBox(height: 32),
        if (request.status == "Requested")
          Row(
            children: [
              Expanded(
                child: Obx(() {
                  final loading = controller.cancelRequestLoading.value &&
                      controller.cancelRequestLoadingList.contains(request.id);
                  return OutlinedButton.icon(
                    icon: Flash(
                        infinite: loading,
                        animate: loading,
                        child: const Icon(Icons.cancel)),
                    label: Text(loading ? 'Calceling ...' : 'Cancel Request'),
                    onPressed: () {
                      controller.cancelRequest(request);
                    },
                  );
                }),
              ),
            ],
          ),
      ],
    );
  }

  // Helper functions
  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "Requested":
        return Colors.orange;
      case "In Progress":
        return Colors.blue;
      case "Completed":
        return Colors.green;
      case "Cancelled":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Widget _getLeadingIcon(String type, {double size = 24}) {
    IconData iconData;

    switch (type) {
      case "Meeting":
        iconData = Icons.meeting_room;
        break;
      case "Call":
        iconData = Icons.phone;
        break;
      case "Training":
        iconData = Icons.school;
        break;
      default:
        iconData = Icons.event;
    }

    return CircleAvatar(
      backgroundColor: kpurple400!.withOpacity(0.1),
      radius: size * 0.7,
      child: Icon(
        iconData,
        color: kpurple400!,
        size: size,
      ),
    );
  }
}
