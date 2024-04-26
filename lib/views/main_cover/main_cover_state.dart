import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/views/home/home_cubit.dart';
import 'package:test_project/views/home/home_screen.dart';
import 'package:test_project/views/settings/settings_cubit.dart';
import 'package:test_project/views/settings/settings_screen.dart';

class MainCoverState {
  static final List<Widget> tabs = [
    BlocProvider(
      create: (_) => HomeCubit(),
      child: HomeScreen(),
    ),
    BlocProvider(
      create: (_) => SettingsCubit(),
      child: const SettingsScreen(),
    ),
  ];

  final int tabIndex;
  final bool isLoading;

  MainCoverState(this.tabIndex, this.isLoading);

  MainCoverState copyWith({int? tabIndex, bool? isLoading}) =>
      MainCoverState(tabIndex ?? this.tabIndex, isLoading ?? this.isLoading);
}
