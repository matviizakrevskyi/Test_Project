import 'package:flutter/material.dart';
import 'package:test_project/views/styling.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const CustomButton({super.key, required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Ink(
        width: MediaQuery.of(context).size.width - 32,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: CustomColors.black, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          onTap: onTap,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                  icon,
                  size: 24,
                  color: CustomColors.black,
                ),
              ),
              Text(
                title,
                style: CustomTextStyles.mainBold,
              )
            ],
          ),
        ),
      ),
    );
  }
}
