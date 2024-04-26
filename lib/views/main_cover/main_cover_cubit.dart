import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/views/main_cover/main_cover_state.dart';

class MainCoverCubit extends Cubit<MainCoverState> {
  MainCoverCubit() : super(MainCoverState(0, false));

  changeScreen(int index) {
    emit(state.copyWith(tabIndex: index));
  }
}
