import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/extension/int_ext_time.dart';
import 'package:test_project/views/home/home_cubit.dart';
import 'package:test_project/views/home/home_state.dart';
import 'package:test_project/views/styling.dart';
import 'package:test_project/views/widgets/time_picker.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: state.isPlaying
                    ? null
                    : () {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (context) {
                              return TimePicker(
                                oldDuration: state.duration,
                                onDone: (duration) {
                                  cubit.setDuration(duration);
                                },
                              );
                            });
                      },
                child: Text(
                  state.duration.formatTime(),
                  style: CustomTextStyles.mainBold,
                ),
              ),
              IconButton(
                  onPressed: () {
                    cubit.onMainButton();
                  },
                  icon: state.isPlaying ? Icon(Icons.pause_outlined) : Icon(Icons.play_arrow))
            ],
          ),
        );
      },
    );
  }
}
