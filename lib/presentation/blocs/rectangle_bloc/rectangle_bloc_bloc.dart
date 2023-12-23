import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:roquete_task/config/helpers/states.dart';

part 'rectangle_bloc_event.dart';
part 'rectangle_bloc_state.dart';

class RectangleBlocBloc extends Bloc<RectangleBlocEvent, RectangleBlocState> {
  final RectangleStates isLoaded;
  RectangleBlocBloc(this.isLoaded) : super(const RectangleInitialBloc()) {
    on<OnClick> (_onClick);
  }

  void _onClick( OnClick event, Emitter<RectangleBlocState> emit ) async {
    emit(const RectangleLoadingBloc(colors: Colors.blue));
    bool loaded = await isLoaded.waitingTime();
    loaded ? emit(const RectangleLoadedBloc(colors: Colors.green)) : emit(const RectangleErrorBloc(colors: Colors.red));
  }
  void onClick(){
    add(OnClick());
  }
}
