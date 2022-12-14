part of 'nutrition_bloc.dart';

class NutritionEvent extends Equatable {
  const NutritionEvent();

  @override
  List<Object> get props => [];
}

class ScanBarcode extends NutritionEvent {
  final QRViewController controller;
  const ScanBarcode({required this.controller});
}

class GetNutritionData extends NutritionEvent {
  final String barcode;
  const GetNutritionData({required this.barcode});
}

class GetNutritionDataFromProduct extends NutritionEvent {
  final Product product;
  const GetNutritionDataFromProduct({required this.product});
}

class AddProductToHistory extends NutritionEvent {
  final Product product;
  const AddProductToHistory({required this.product});
}
