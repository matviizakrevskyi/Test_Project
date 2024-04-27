import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/views/settings/settings_cubit.dart';
import 'package:test_project/views/styling.dart';
import 'package:test_project/views/widgets/custom_button.dart';
import 'package:test_project/views/widgets/custom_dropdown_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SettingsCubit>();
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
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 16,
            ),
            CustomDropdownButton(
              items: const ["English", "Germany"],
              selectedItem: context.locale.languageCode == "en" ? "English" : "Germany",
              onItem: (item) {
                cubit.onDropdownItem(context, item);
              },
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
          onTap: () {
            cubit.onRate(context);
          },
        ),
        const SizedBox(
          height: 16,
        ),
        CustomButton(
          title: "Share App",
          icon: Icons.share,
          onTap: () {
            cubit.onShare();
          },
        ),
        const SizedBox(
          height: 16,
        ),
        CustomButton(
          title: "Contact Us",
          icon: Icons.mail,
          onTap: () {
            cubit.onContact();
          },
        ),
      ],
    );
  }
}
