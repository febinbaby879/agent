import 'package:flutter/material.dart';

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
