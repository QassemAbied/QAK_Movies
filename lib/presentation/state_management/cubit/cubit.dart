import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/presentation/state_management/cubit/states.dart';
import 'package:untitled3/presentation/views/watchlist_screen.dart';
import 'package:untitled3/presentation/views/home_screen.dart';
import 'package:untitled3/presentation/views/search_screen.dart';

class ChangeBottomCubit extends Cubit<ChangeStates>{
  ChangeBottomCubit() : super(InitialStateBottom());
  static ChangeBottomCubit get(context)=> BlocProvider.of(context);


  int CurrentIndex =0;
  void ChangeBottom(int index){
    CurrentIndex =index;
    emit(ChangeBottomState());
  }
}