import 'package:flutter/material.dart';
import 'package:test_project/views/styling.dart';
import 'package:test_project/views/widgets/custom_button.dart';
import 'package:test_project/views/widgets/custom_dropdown_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 24,
            ),
            Text(
              "Settings",
              style: CustomTextStyles.h1,
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 16,
            ),
            CustomDropdownButton(
              items: ["English", "Germany"],
              selectedItem: 'English',
            ),
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 24,
            ),
            Text(
              "Other",
              style: CustomTextStyles.h2,
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        CustomButton(
          title: "Rate App",
          icon: Icons.star,
          onTap: () {},
        ),
        const SizedBox(
          height: 16,
        ),
        CustomButton(
          title: "Share App",
          icon: Icons.share,
          onTap: () {},
        ),
        const SizedBox(
          height: 16,
        ),
        CustomButton(
          title: "Contact Us",
          icon: Icons.mail,
          onTap: () {},
        ),
      ],
    );
  }
}
