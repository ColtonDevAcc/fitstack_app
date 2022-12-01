import 'dart:developer';

import 'package:FitStack/app/helpers/fitstack_error_toast.dart';
import 'package:FitStack/app/repository/open_food_facts_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

part 'nutrition_event.dart';
part 'nutrition_state.dart';

class NutritionBloc extends Bloc<NutritionEvent, NutritionState> {
  final OpenFoodFactsRepository openFoodFactsRepository;
  NutritionBloc({required this.openFoodFactsRepository})
      : super(NutritionState(
          status: NutritionStatus.initial,
          recentMeals: [],
          barcode: '',
          panelController: PanelController(),
        )) {
    on<GetNutritionData>(onGetNutritionData);
    on<ScanBarcode>(onScanBarcode);
  }

  Future<void> onGetNutritionData(GetNutritionData event, Emitter<NutritionState> emit) async {
    try {
      emit(state.copyWith(status: NutritionStatus.loading, barcode: event.barcode));

      log("Getting Nutrition Data for ${event.barcode}");
      final product = await openFoodFactsRepository.getProduct(barcode: event.barcode);
      log("Product: ${product?.toJson()}");
      emit(state.copyWith(status: NutritionStatus.success, product: product));
      state.panelController.open();
    } on PlatformException {
      FitStackToast.showErrorToast("Failed to get platform version");
    }
  }

  Future<void> onScanBarcode(ScanBarcode event, Emitter<NutritionState> emit) async {
    try {
      event.controller.scannedDataStream.listen(
        (barcode) {
          if (barcode.code != null) {
            event.controller.pauseCamera();
            add(GetNutritionData(barcode: barcode.code!));
          } else {
            log("Barcode: ${barcode.code} is null");
          }
        },
      );
    } on PlatformException {
      FitStackToast.showErrorToast("Failed to get platform version");
    }
  }

  @override
  Future<void> close() async {
    state.scanController?.dispose();
    super.close();
  }
}
