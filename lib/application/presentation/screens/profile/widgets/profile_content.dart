import 'package:agent_dashboard/application/controller/profile/profile_controller.dart';
import 'package:agent_dashboard/application/presentation/screens/profile/widgets/side_bar.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/utils/enum/enum.dart';
import 'package:agent_dashboard/application/presentation/utils/html/html_page_viewer.dart';
import 'package:agent_dashboard/application/presentation/utils/image_preview/network_image_with_loader.dart';
import 'package:agent_dashboard/application/presentation/widgets/dropdown_builder.dart';
import 'package:agent_dashboard/application/presentation/widgets/hover/hover_switcher.dart';
import 'package:agent_dashboard/application/presentation/widgets/text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ProfileContent extends StatelessWidget {
  final bool isSmallScreen;
  final bool isTab;

  const ProfileContent(
      {super.key, required this.isSmallScreen, required this.isTab});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: isSmallScreen
          ? AppBar(
              title: const Text('Business Information',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              backgroundColor: kWhite,
              foregroundColor: Colors.black,
              elevation: 0,
              shadowColor: Colors.black12,
            )
          : null,
      drawer: isSmallScreen
          ? const Drawer(child: SidebarWidget(maxWidth: 280))
          : null,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(isSmallScreen ? 12 : 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            if (!isSmallScreen)
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: Row(
                  children: [
                    Container(
                      width: 4,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.blue[600],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Business Information',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                  ],
                ),
              ),

            // Main Profile Card
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    spreadRadius: 0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(isSmallScreen ? 16 : 32),
                child: Obx(
                  () => Column(
                    children: [
                      // Profile Header with Edit Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Profile Details',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2D3748),
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              color: controller.enableEdit.value
                                  ? Colors.red[50]
                                  : Colors.blue[50],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: IconButton(
                              onPressed: () {
                                controller
                                    .showEdit(!controller.enableEdit.value);
                              },
                              icon: Icon(
                                controller.enableEdit.value
                                    ? Icons.close_rounded
                                    : Icons.edit_outlined,
                                color: controller.enableEdit.value
                                    ? Colors.red[600]
                                    : Colors.blue[600],
                              ),
                              tooltip: controller.enableEdit.value
                                  ? 'Cancel Edit'
                                  : 'Edit Profile',
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),
                      const Divider(color: Color(0xFFE2E8F0)),
                      const SizedBox(height: 24),

                      // Profile Content
                      isSmallScreen || isTab
                          ? _buildMobileLayout(controller, context)
                          : _buildDesktopLayout(controller, context),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLayout(
      ProfileController controller, BuildContext context) {
    return Column(
      children: [
        // Profile Image and Basic Info
        _buildProfileHeader(controller, context, isMobile: true),
        const SizedBox(height: 32),

        // Profile Fields
        _buildProfileFields(controller, context),

        // Social Media Section
        // if (controller.profileInfo.value.socialMediaLinks != null &&
        //     controller.profileInfo.value.socialMediaLinks!.isNotEmpty)
        _buildSocialMediaSection(context, controller),
        _buildAgrementSection(context, controller),
      ],
    );
  }

  Widget _buildDesktopLayout(
      ProfileController controller, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Column - Profile Image and Basic Info
        Expanded(
          flex: 1,
          child: _buildProfileHeader(controller, context, isMobile: false),
        ),

        const SizedBox(width: 48),

        // Right Column - Profile Fields
        Expanded(
          flex: 2,
          child: Column(
            children: [
              _buildProfileFields(controller, context),

              // Social Media Section
              // if (controller.profileInfo.value.socialMediaLinks != null &&
              //     controller.profileInfo.value.socialMediaLinks!.isNotEmpty)
              _buildSocialMediaSection(context, controller),
              kHeight10,
              _buildAgrementSection(context, controller),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProfileHeader(ProfileController controller, BuildContext context,
      {required bool isMobile}) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                kpurple400!.withOpacity(0.1),
                kpurple400!.withOpacity(0.3)
              ],
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.blue[100]!),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Profile Image with enhanced styling
              GestureDetector(
                onTap: () {
                  controller.uploadProfilePicture();
                },
                child: Obx(
                  () => Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: kpurple400!.withOpacity(0.2),
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Container(
                        width: isMobile ? 80 : 120,
                        height: isMobile ? 80 : 120,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 4),
                          shape: BoxShape.circle,
                        ),
                        child: controller.profileImageLoading.value
                            ? const CupertinoActivityIndicator(color: kBlack)
                            : NetworkImageWithLoader(
                                radius: 200,
                                controller.profileInfo.value.profileImg ?? '',
                                fit: BoxFit.cover,
                                casheImage: false,
                                errorWidget:
                                    const Icon(Icons.file_upload_outlined),
                              ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Name and Designation
              Text(
                controller.profileInfo.value.agentName ?? 'Name',
                style: TextStyle(
                  fontSize: isMobile ? 18 : 22,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2D3748),
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 8),

              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: kpurple400!.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  controller.profileInfo.value.agentId ?? 'Agent ID',
                  style: const TextStyle(
                    color: kWhite,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        kHeight15,
        Obx(() => Row(
              children: [
                _fileUploadWidget(isMobile, controller,
                    img: controller.profileInfo.value.businessLicense,
                    title: 'Business License',
                    loading: controller.businessLicenseLoading.value,
                    onTap: () {
                  controller.uploadBusinessLicense();
                }),
                kWidth10,
                _fileUploadWidget(isMobile, controller,
                    img: controller.profileInfo.value.passportFile,
                    title: 'Passport Image',
                    loading: controller.passportImageLoading.value, onTap: () {
                  controller.uploadPassportFile();
                }),
              ],
            ))
      ],
    );
  }

  Expanded _fileUploadWidget(bool isMobile, ProfileController controller,
      {String? img,
      String title = '',
      VoidCallback? onTap,
      bool loading = false}) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title),
          kHeight5,
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: isMobile ? 60 : 80,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: kRadius10,
              ),
              child: MouseHoverSwitcher(
                hoverChild:
                    const Center(child: Icon(Icons.file_upload_outlined)),
                child: loading
                    ? const Center(
                        child: CupertinoActivityIndicator(color: kBlack))
                    : NetworkImageWithLoader(
                        img,
                        radius: 10,
                        fit: BoxFit.cover,
                        errorWidget: const Icon(Icons.file_upload_outlined),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileFields(
      ProfileController controller, BuildContext context) {
    final fields = [
      {
        'label': 'Email',
        'value': controller.profileInfo.value.agentEmailId,
        'editable': false
      },
      {
        'label': 'Country',
        'value': controller.profileInfo.value.agentCountry,
        'editable': false
      },
      {
        'label': 'Phone',
        'value': controller.profileInfo.value.agentPhoneNumber,
        'editable': false
      },
      {
        'label': 'Company Type',
        'value': controller.profileInfo.value.companyType,
        'editable': false
      },
      {
        'label': 'Designation',
        'value': controller.profileInfo.value.designation,
        'editable': true,
        'controller': controller.designationController
      },
      {
        'label': 'Business Reg. No.',
        'value': controller.profileInfo.value.businessRegNum,
        'editable': true,
        'controller': controller.businessRegNumController
      },
      {
        'label': 'Contact Person',
        'value': controller.profileInfo.value.nameofContactPerson,
        'editable': true,
        'controller': controller.contactPersonController
      },
      {
        'label': 'Full Address',
        'value': controller.profileInfo.value.fullAddress,
        'editable': true,
        'controller': controller.addressController
      },
      {
        'label': 'Website',
        'value': controller.profileInfo.value.websiteLink,
        'editable': true,
        'controller': controller.websitController
      },
      {
        'label': 'Date of Birth',
        'value': controller.profileInfo.value.dateofBirth,
        'editable': true,
        'controller': controller.dateOfBirthController,
        'isDate': true
      },
      {
        'label': 'Director Name',
        'value': controller.profileInfo.value.directorName,
        'editable': true,
        'controller': controller.directorNameController
      },
      {
        'label': 'Director Contact',
        'value': controller.profileInfo.value.directorContactNumber,
        'editable': true,
        'controller': controller.directorPhoneController
      },
    ];
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Information Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2D3748),
                ),
              ),
              if (controller.enableEdit.value) const Spacer(),
              if (controller.enableEdit.value)
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: kWhite, backgroundColor: kpurple400),
                    onPressed: () {
                      controller.updateProfileInfo();
                    },
                    child: controller.profileinfoUpdateLoading.value
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              color: kWhite,
                            ),
                          )
                        : const Text('Update'))
            ],
          ),
          const SizedBox(height: 20),

          // Grid layout for fields
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isTab ? 1 : 2,

              /// need to do someting to make it proper responsive
              childAspectRatio: width > 1100
                  ? 4
                  : width > 900
                      ? 3
                      : width > 800
                          ? 4
                          : isSmallScreen
                              ? 5
                              : isTab
                                  ? 4
                                  : 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: fields.length,
            itemBuilder: (context, index) {
              final field = fields[index];
              return _profileField(
                context,
                field['label'] as String,
                field['value'] as String?,
                enableEdit: controller.enableEdit.value &&
                    (field['editable'] as bool? ?? false),
                date: field['isDate'] as bool? ?? false,
                controller: field['controller'] as TextEditingController?,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaSection(
      BuildContext context, ProfileController controller) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.purple[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.purple[100]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.share, color: Colors.purple[600], size: 20),
              const SizedBox(width: 8),
              const Text(
                'Social Media Links',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xFF2D3748),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                child: Icon(Icons.edit_note_outlined,
                    color: Colors.purple[600], size: 20),
                onPressed: () {
                  _buildSocialMediaAddingDialog(context, controller);
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (controller.profileInfo.value.socialMediaLinks?.isNotEmpty ??
              false)
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: (controller.profileInfo.value.socialMediaLinks!
                      .where((e) => e.url?.isNotEmpty ?? false))
                  .map<Widget>((link) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.purple[200]!),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.purple.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          link.url.toString(),
                          style: TextStyle(
                            color: Colors.purple[700],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ))
                  .toList(),
            ),
        ],
      ),
    );
  }

  Future<dynamic> _buildSocialMediaAddingDialog(
      BuildContext context, ProfileController controller) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Social Media Links',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xFF2D3748),
                      ),
                    ),
                    kHeight10,
                    ...List.generate(socialMediaPlatforms.length, (index) {
                      String media = socialMediaPlatforms[index];
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.link),
                              kWidth10,
                              Expanded(
                                child: CustomTextField(
                                  hintText: media,
                                  lebelText: media,
                                  controller: controller
                                      .getSocialMediaController(media),
                                ),
                              )
                            ],
                          ),
                          kHeight5,
                        ],
                      );
                    }),
                    kHeight10,
                    Align(
                      alignment: Alignment.centerRight,
                      child: Obx(
                        () => SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                foregroundColor: kWhite,
                                backgroundColor: kpurple400),
                            onPressed: () async {
                              final success =
                                  await controller.updateSocialMediaLinks();
                              if (success) {
                                GoRouter.of(context).pop();
                              }
                            },
                            child: controller
                                    .profileinfoUpdateSocialMediaLoading.value
                                ? const CupertinoActivityIndicator(
                                    color: kWhite)
                                : const Text('Update'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _profileField(
    BuildContext context,
    String label,
    String? value, {
    bool enableEdit = false,
    bool date = false,
    List<String>? dropDown,
    TextEditingController? controller,
    Validate validate = Validate.none,
  }) {
    if (enableEdit) {
      if (enableEdit && dropDown != null) {
        return CustomDropDownBuilder(
          items: dropDown,
          onChanged: (data) {
            controller?.text = data ?? "";
          },
        );
      }
      return CustomTextField(
        validate: validate,
        hintText: label,
        lebelText: label,
        controller: controller,
        onTap: () async {
          if (date) {
            final result = await showDatePicker(
              context: context,
              firstDate:
                  DateTime.now().subtract(const Duration(days: 365 * 100)),
              lastDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
            );
            if (result != null) {
              controller?.text =
                  '${result.year}-${result.month.toString().padLeft(2, '0')}-${result.day.toString().padLeft(2, '0')}';
            }
          }
        },
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: enableEdit
              ? const Color.fromARGB(0, 255, 255, 255)!
              : Colors.grey[200]!,
          width: enableEdit ? 2 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[600],
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
          kHeight5,
          Text(
            value?.isNotEmpty == true ? value! : 'N/A',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              // fontSize: 14,
              // color: Color(0xFF2D3748),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAgrementSection(
      BuildContext context, ProfileController controller) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            const Text('Review Agreement'),
            const Spacer(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kpurple400, foregroundColor: kWhite),
                onPressed: () {
                  controller.getCompletedAgrement();
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Obx(() {
                          if (controller.getAgreementLoading.value) {
                            return const Center(
                              child: CupertinoActivityIndicator(),
                            );
                          }
                          if (controller.agrementModel.value.generatedAgreement
                                  ?.content?.isEmpty ??
                              true) {
                            return const Center(
                              child: Text('Agreement not Availale'),
                            );
                          }
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Column(
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: HtmlToPdfView(
                                        htmlContent: controller.agrementModel
                                            .value.generatedAgreement!.content!,
                                        containerId: 'html-container'),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: kpurple400,
                                        foregroundColor: kWhite),
                                    onPressed: () {
                                      controller.downloadAgrement();
                                    },
                                    icon: const Icon(Icons.download),
                                    label: const Text('Download'),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                      );
                    },
                  );
                },
                child: const Text('Preview'))
          ],
        ),
      ),
    );
  }
}
