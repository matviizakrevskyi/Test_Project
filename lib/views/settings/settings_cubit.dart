import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/views/settings/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState(false));
}
