import 'dart:ffi';

import 'package:FitStack/app/models/program/program_model.dart';
import 'package:FitStack/app/repository/program_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'program_state.dart';

class ProgramCubit extends Cubit<ProgramState> {
  final ProgramRepository programRepository;
  ProgramCubit({required this.programRepository}) : super(ProgramState(programs: null));

  Future<void> getPrograms() async {
    try {
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
      List<Program> programs = await programRepository.getPrograms(token: token!);

      emit(state.copyWith(programs: programs));
    } catch (e) {
      Fluttertoast.showToast(
        msg: "$e",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
