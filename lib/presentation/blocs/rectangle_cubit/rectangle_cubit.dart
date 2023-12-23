
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:roquete_task/config/helpers/states.dart';

part 'rectangle_state.dart';

class RectangleCubit extends Cubit<RectangleState> {
  final RectangleStates isLoaded;
  RectangleCubit(this.isLoaded) : super(const RectangleInitial());

  void onClick() async {

    emit(const RectangleLoading(colors: Colors.blue));
    bool loaded = await isLoaded.waitingTime();
    loaded ? emit(const RectangleLoaded(colors: Colors.green)) : emit(const RectangleError(colors: Colors.red));
  }

}
