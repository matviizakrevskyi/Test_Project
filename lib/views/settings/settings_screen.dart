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
    return Scaffold(
      backgroundColor: CustomColors.main,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            "settings".tr(),
            style: CustomTextStyles.h1,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 16,
              ),
              CustomDropdownButton(
                items: const ["English", "Deutsch"],
                selectedItem: context.locale.languageCode == "en" ? "English" : "Deutsch",
                onItem: (item) {
                  cubit.onDropdownItem(context, item);
                },
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 24,
              ),
              Text(
                "other".tr(),
                style: CustomTextStyles.h2,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            title: "rate_app".tr(),
            icon: Icons.star,
            onTap: () {
              cubit.onRate(context);
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            title: "share_app".tr(),
            icon: Icons.share,
            onTap: () {
              cubit.onShare();
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            title: "contact_us".tr(),
            icon: Icons.mail,
            onTap: () {
              cubit.onContact();
            },
          ),
        ],
      ),
    );
  }
}
