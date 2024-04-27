import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:test_project/views/styling.dart';

class CustomDropdownButton extends StatelessWidget {
  final List<String> items;
  final String selectedItem;
  final Function(String) onItem;

  const CustomDropdownButton(
      {super.key, required this.items, required this.selectedItem, required this.onItem});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: const Row(
          children: [
            Icon(
              Icons.arrow_downward,
              size: 16,
              color: CustomColors.black,
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                'Select Item',
                style: CustomTextStyles.mainBold,
              ),
            ),
          ],
        ),
        items: items
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: CustomTextStyles.mainBold,
                  ),
                ))
            .toList(),
        value: selectedItem,
        onChanged: (value) {onItem(value ?? "");},
        buttonStyleData: ButtonStyleData(
          height: 50,
          width: 160,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: CustomColors.black, width: 2),
            color: CustomColors.main,
          ),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
          ),
          iconSize: 24,
          iconEnabledColor: CustomColors.black,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: CustomColors.main,
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}
