part of 'nutrition_bloc.dart';

class NutritionEvent extends Equatable {
  const NutritionEvent();

  @override
  List<Object> get props => [];
}

class ScanBarcode extends NutritionEvent {
  final QRViewController controller;
  ScanBarcode({required this.controller});
}

class GetNutritionData extends NutritionEvent {
  final String barcode;
  GetNutritionData({required this.barcode});
}