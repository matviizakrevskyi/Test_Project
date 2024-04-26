import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/extension/int_ext_time.dart';
import 'package:test_project/views/home/home_cubit.dart';
import 'package:test_project/views/home/home_state.dart';
import 'package:test_project/views/styling.dart';
import 'package:test_project/views/widgets/pulsating_widget.dart';
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
                borderRadius: const BorderRadius.all(Radius.circular(12)),
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
                child: PulsatingWidget(
                  isAnimate: state.isPlaying,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      state.duration.formatTime(),
                      style: CustomTextStyles.h2,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              PulsatingWidget(
                isAnimate: !state.isPlaying,
                child: Ink(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: CustomColors.blue),
                  child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      onTap: () {
                        cubit.onMainButton();
                      },
                      child: state.isPlaying
                          ? const Icon(
                              Icons.pause_outlined,
                              color: Colors.white,
                              size: 40,
                            )
                          : const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 40,
                            )),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
