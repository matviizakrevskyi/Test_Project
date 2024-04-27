import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_project/views/styling.dart';

class TimePicker extends StatelessWidget {
  final int oldDuration;
  final Function(int) onDone;

  TimePicker({super.key, required this.oldDuration, required this.onDone});

  @override
  Widget build(BuildContext context) {
    Duration duration = Duration(seconds: oldDuration);
    return Container(
      height: 300,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    onDone(duration.inSeconds);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "done".tr(),
                    style: CustomTextStyles.mainBold,
                  ),
                ),
              )
            ],
          ),
          CupertinoTimerPicker(
            mode: CupertinoTimerPickerMode.hms,
            initialTimerDuration: Duration(seconds: oldDuration),
            onTimerDurationChanged: (Duration newTimer) {
              duration = newTimer;
            },
          ),
        ],
      ),
    );
  }
}
