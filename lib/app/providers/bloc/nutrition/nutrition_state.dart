part of 'nutrition_bloc.dart';

class NutritionState extends Equatable {
  final NutritionStatus status;
  final Product? product;
  final String barcode;
  final List<Product> recentProducts;
  final QRViewController? scanController;
  final PanelController panelController;
  const NutritionState({
    required this.panelController,
    required this.barcode,
    this.scanController,
    required this.recentProducts,
    this.product,
    required this.status,
  });

  @override
  List<Object?> get props => [status, recentProducts, scanController, barcode, product, panelController];

  NutritionState copyWith({
    Product? product,
    NutritionStatus? status,
    List<Product>? recentMeals,
    QRViewController? scanController,
    String? barcode,
    PanelController? panelController,
  }) {
    return NutritionState(
      product: product ?? this.product,
      status: status ?? this.status,
      recentProducts: recentMeals ?? recentProducts,
      scanController: scanController ?? this.scanController,
      barcode: barcode ?? this.barcode,
      panelController: panelController ?? this.panelController,
    );
  }
}

enum NutritionStatus { initial, loading, success, failure }
