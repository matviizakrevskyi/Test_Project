import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:share_plus/share_plus.dart';
import 'package:test_project/views/settings/settings_state.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState(false));

  onDropdownItem(BuildContext context, String item) {
    if (item == "English") {
      context.setLocale(const Locale("en", "US"));
    } else if (item == "Germany") {
      context.setLocale(const Locale("de", "DE"));
    }
  }

  onRate(BuildContext context) async {
    final rating = RateMyApp();
    await rating.init();
    rating.showRateDialog(context);
  }

  onShare() {
    Share.share('https://energise.notion.site/Flutter-f86d340cadb34e9cb1ef092df4e566b7');
  }

  onContact() async {
    await launch('https://www.google.com/');
  }
}
