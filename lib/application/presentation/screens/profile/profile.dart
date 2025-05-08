import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
          body: SafeArea(child: LayoutBuilder(builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 600;
        return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (!isSmallScreen)
            SidebarWidget(maxWidth: constraints.maxWidth * 0.3),
          Expanded(child: ProfileContent(isSmallScreen: isSmallScreen))
        ]);
      })));
}

class SidebarWidget extends StatelessWidget {
  final double maxWidth;

  const SidebarWidget({super.key, required this.maxWidth});

  @override
  Widget build(BuildContext context) => Container(
      width: maxWidth,
      color: kWhite,
      child: SingleChildScrollView(
          child: Column(children: [
        // User profile card
        Container(
            padding: const EdgeInsets.all(16),
            color: kWhite,
            child: Row(children: [
              CircleAvatar(
                  radius: 36,
                  backgroundColor: kpurple400,
                  child: const Icon(Icons.person, size: 36, color: kWhite)),
              kWidth10,
              const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello,',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    Text('Feb Bab',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87))
                  ])
            ])),
        kHeight10,
        // MY ORDERS
        NavItem(
            icon: Icons.shopping_bag_outlined,
            title: 'Wishlists',
            isSelected: false,
            onTap: () {}),
        // ACCOUNT SETTINGS
        NavItem(
          icon: Icons.person_outline,
          title: 'Cart',
          isSelected: true,
          onTap: () {},
        ),
        NavItem(
          icon: Icons.person_outline,
          title: 'About us',
          isSelected: true,
          onTap: () {},
        ),
        NavItem(
            icon: Icons.payment_outlined,
            title: 'PAYMENTS',
            isSelected: false,
            onTap: () {}),
        NavItem(
          icon: Icons.folder_outlined,
          title: 'MY STUFF',
          isSelected: false,
          onTap: () {},
        )
      ])));
}

class NavItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const NavItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) => ListTile(
      leading: Icon(
        icon,
        color: isSelected ? Colors.blue : Colors.grey,
      ),
      title: Text(title,
          style: TextStyle(
              color: isSelected ? Colors.blue : Colors.grey[700],
              fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap);
}

class SubNavItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Widget? trailing;

  const SubNavItem({
    super.key,
    required this.title,
    required this.isSelected,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) => Container(
      color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
      child: ListTile(
          contentPadding: const EdgeInsets.only(left: 56, right: 16),
          title: Text(title,
              style: TextStyle(
                  color: isSelected ? Colors.blue : Colors.black87,
                  fontWeight:
                      isSelected ? FontWeight.w500 : FontWeight.normal)),
          trailing: trailing));
}

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
