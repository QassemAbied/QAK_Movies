import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'botton_nav_state.dart';

class ChangeBottomCubit extends Cubit<ChangeStates> {
  ChangeBottomCubit() : super(InitialStateBottom());
  static ChangeBottomCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomState());
  }
}