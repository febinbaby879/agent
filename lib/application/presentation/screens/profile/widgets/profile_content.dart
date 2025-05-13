import 'package:agent_dashboard/application/presentation/screens/profile/widgets/side_bar.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:flutter/material.dart';

class ProfileContent extends StatefulWidget {
  final bool isSmallScreen;

  const ProfileContent({super.key, required this.isSmallScreen});

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  String? _selectedGender = 'Male';

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: widget.isSmallScreen
          ? AppBar(
              title: const Text('Profile Information'),
              backgroundColor: kWhite,
              foregroundColor: Colors.black,
            )
          : null,
      drawer: widget.isSmallScreen
          ? const Drawer(child: SidebarWidget(maxWidth: 280))
          : null,
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Personal Information section
            _buildSectionHeader('Personal Information', onEdit: () {}),
            Card(
                margin: const EdgeInsets.only(top: 8, bottom: 24),
                child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // First name and Last name fields
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: TextFormField(
                                        initialValue: 'Feb',
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'First Name'))),
                                const SizedBox(width: 16),
                                Expanded(
                                    child: TextFormField(
                                        initialValue: 'Bab',
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Last Name')))
                              ]),
                          const SizedBox(height: 24),

                          // Gender selection
                          const Text(
                            'Your Gender',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          Row(children: [
                            Radio<String>(
                              value: 'Male',
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value;
                                });
                              },
                            ),
                            const Text('Male'),
                            const SizedBox(width: 16),
                            Radio<String>(
                              value: 'Female',
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value;
                                });
                              },
                            ),
                            const Text('Female')
                          ])
                        ]))),

            // Email Address section
            _buildSectionHeader('Email Address', onEdit: () {}),
            Card(
              margin: const EdgeInsets.only(top: 8, bottom: 24),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  initialValue: 'febinbaby879@gmail.com',
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,
                ),
              ),
            ),

            // Mobile Number section
            _buildSectionHeader('Mobile Number', onEdit: () {}),
            Card(
                margin: const EdgeInsets.only(top: 8, bottom: 24),
                child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                        initialValue: '+916238075734',
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        readOnly: true))),

            // FAQs section
            const Text(
              'FAQs',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // FAQ item
            const Text(
              'What happens when I update my email address (or mobile number)?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
                'Your login email id (or mobile number) changes, likewise. You\'ll receive all your account related communication on your updated email address.',
                style: TextStyle(fontSize: 14, color: Colors.black87))
          ])));

  Widget _buildSectionHeader(String title, {required VoidCallback onEdit}) =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
            onPressed: onEdit,
            child: const Text('Edit',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)))
      ]);
}
