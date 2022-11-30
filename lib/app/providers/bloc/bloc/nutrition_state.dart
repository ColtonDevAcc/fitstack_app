part of 'nutrition_bloc.dart';

class NutritionState extends Equatable {
  final NutritionStatus status;
  final Product? product;
  final String barcode;
  final List<Product> recentMeals;
  final QRViewController? scanController;
  const NutritionState({required this.barcode, this.scanController, required this.recentMeals, this.product, required this.status});

  @override
  List<Object?> get props => [status, recentMeals, scanController, barcode];

  NutritionState copyWith({
    Product? product,
    NutritionStatus? status,
    List<Product>? recentMeals,
    QRViewController? scanController,
    String? barcode,
  }) {
    return NutritionState(
      product: product ?? this.product,
      status: status ?? this.status,
      recentMeals: recentMeals ?? this.recentMeals,
      scanController: scanController ?? this.scanController,
      barcode: barcode ?? this.barcode,
    );
  }
}

enum NutritionStatus { initial, loading, success, failure }
