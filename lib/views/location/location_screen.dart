import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:test_project/views/location/location_cubit.dart';
import 'package:test_project/views/location/location_state.dart';
import 'package:test_project/views/styling.dart';
import 'package:latlong2/latlong.dart';
import 'package:test_project/views/widgets/custom_button.dart';
import 'package:test_project/views/widgets/location_info_widget.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LocationCubit>();
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: CustomColors.main,
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                "location".tr(),
                style: CustomTextStyles.h1,
              ),
            ),
          ),
          body: Stack(
            fit: StackFit.expand,
            children: [
              state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: CustomColors.black,
                    ))
                  : RefreshIndicator(
                      backgroundColor: Colors.white,
                      color: CustomColors.black,
                      onRefresh: () async {
                        await cubit.fetchDataPullToRefresh();
                      },
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 3,
                            ),
                            MapWidget(
                              coords: LatLng(
                                  state.locationData?.lat ?? 0.0, state.locationData?.lon ?? 0.0),
                              controller: cubit.mapController,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  "additional_info".tr(),
                                  style: CustomTextStyles.h2,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            if (state.locationData != null) InfoWidget(state.locationData!),
                            const SizedBox(
                              height: 32,
                            )
                          ],
                        ),
                      ),
                    ),
              Positioned(
                bottom: 16,
                child: CustomButton(
                  title: "reload".tr(),
                  icon: Icons.replay_circle_filled_outlined,
                  onTap: () {
                    if (!state.isLoading) {
                      cubit.fetchData();
                    }
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class MapWidget extends StatelessWidget {
  final LatLng coords;
  final MapController controller;

  const MapWidget({super.key, required this.coords, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: FlutterMap(
        mapController: controller,
        options: MapOptions(
          initialCenter: coords,
          initialZoom: 10,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
        ],
      ),
    );
  }
}
