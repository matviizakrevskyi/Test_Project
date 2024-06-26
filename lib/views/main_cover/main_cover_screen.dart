import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/views/main_cover/main_cover_cubit.dart';
import 'package:test_project/views/main_cover/main_cover_state.dart';
import 'package:test_project/views/styling.dart';

class MainCoverScreen extends StatelessWidget {
  const MainCoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MainCoverCubit>();
    return BlocBuilder<MainCoverCubit, MainCoverState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: CustomColors.main,
          bottomNavigationBar: _BottomNavigationBar(
            onTab: (index) {
              cubit.changeScreen(index);
            },
          ),
          body: AnimatedOpacity(
            opacity: state.animationOpacity,
            duration: Duration(milliseconds: state.animationOpacity == 0 ? 0 : 400),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: MainCoverState.tabs[state.tabIndex],
            ),
          ),
        );
      },
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  final Function(int) onTab;

  const _BottomNavigationBar({required this.onTab});

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _BottomBarItem(
            onTap: () {
              onTab(0);
            },
            name: "home".tr(),
            icon: Icons.home,
          ),
          _BottomBarItem(
            onTap: () {
              onTab(1);
            },
            name: "location".tr(),
            icon: Icons.location_on,
          ),
          _BottomBarItem(
            onTap: () {
              onTab(2);
            },
            name: "settings".tr(),
            icon: Icons.settings,
          ),
        ],
      ),
    );
  }
}

class _BottomBarItem extends StatelessWidget {
  final VoidCallback onTap;
  final String name;
  final IconData icon;

  const _BottomBarItem({required this.onTap, required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        onTap: onTap,
        child: SizedBox(
          width: 70,
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.black,
              ),
              Text(name, style: CustomTextStyles.secondaryBold.copyWith(fontSize: 12))
            ],
          ),
        ),
      ),
    );
  }
}
