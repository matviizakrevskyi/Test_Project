import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/views/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(0));

  onButton() {}
}
