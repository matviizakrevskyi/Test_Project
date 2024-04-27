import 'package:flutter/material.dart';
import 'package:test_project/models/location.dart';
import 'package:test_project/views/styling.dart';

class InfoWidget extends StatelessWidget {
  final Location locationData;

  const InfoWidget(this.locationData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              RichText(
                text: TextSpan(
                  text: "Country: ",
                  style: CustomTextStyles.main,
                  children: [
                    TextSpan(
                        text: "${locationData.country}(${locationData.countryCode})",
                        style: CustomTextStyles.mainBold)
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  text: "Region: ",
                  style: CustomTextStyles.main,
                  children: [
                    TextSpan(
                        text: "${locationData.regionName}(${locationData.region})",
                        style: CustomTextStyles.mainBold)
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  text: "City: ",
                  style: CustomTextStyles.main,
                  children: [
                    TextSpan(text: "${locationData.city}", style: CustomTextStyles.mainBold)
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  text: "Zip Code: ",
                  style: CustomTextStyles.main,
                  children: [TextSpan(text: locationData.zip, style: CustomTextStyles.mainBold)],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  text: "Timezone: ",
                  style: CustomTextStyles.main,
                  children: [
                    TextSpan(text: locationData.timezone, style: CustomTextStyles.mainBold)
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
