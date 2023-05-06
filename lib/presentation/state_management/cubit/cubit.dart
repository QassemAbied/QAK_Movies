import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/presentation/state_management/cubit/states.dart';

class ChangeBottomCubit extends Cubit<ChangeStates> {
  ChangeBottomCubit() : super(InitialStateBottom());
  static ChangeBottomCubit get(context) => BlocProvider.of(context);

  int CurrentIndex = 0;
  void ChangeBottom(int index) {
    CurrentIndex = index;
    emit(ChangeBottomState());
  }
}
