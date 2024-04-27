import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/views/location/location_cubit.dart';
import 'package:test_project/views/widgets/custom_button.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
        ),
        CustomButton(
            title: "Reload",
            icon: Icons.replay_circle_filled_outlined,
            onTap: () => context.read<LocationCubit>().getData())
      ],
    );
  }
}
