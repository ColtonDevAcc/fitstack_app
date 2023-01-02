import 'package:FitStack/app/models/program/program_model.dart';
import 'package:FitStack/app/repository/program_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

part 'program_state.dart';

class ProgramCubit extends Cubit<ProgramState> {
  final ProgramRepository programRepository;
  ProgramCubit({required this.programRepository}) : super(const ProgramState(programs: null, status: ProgramStatus.initial));

  Future<void> getPrograms() async {
    emit(state.copyWith(status: ProgramStatus.loading));
    try {
      final String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
      final List<Program> programs = await programRepository.getPrograms(token: token!);

      emit(state.copyWith(programs: programs, status: ProgramStatus.success));
    } catch (e) {
      Fluttertoast.showToast(
        msg: "$e",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
