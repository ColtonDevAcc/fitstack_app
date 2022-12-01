import 'package:FitStack/app/providers/bloc/bloc/nutrition_bloc.dart';
import 'package:FitStack/widgets/atoms/basic_view_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:openfoodfacts/model/Nutrient.dart';
import 'package:openfoodfacts/model/PerSize.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class NutritionScanView extends StatelessWidget {
  const NutritionScanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: QRView(
                  key: GlobalKey(debugLabel: 'QR'),
                  onQRViewCreated: (p0) {
                    context.read<NutritionBloc>().add(ScanBarcode(controller: p0));
                  },
                  overlay: QrScannerOverlayShape(
                    borderColor: Colors.red,
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: 300,
                  ),
                ),
              ),
            ],
          ),
          BlocBuilder<NutritionBloc, NutritionState>(
            builder: (context, state) {
              return SlidingUpPanel(
                  maxHeight: 700,
                  minHeight: 80,
                  controller: state.panelController,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  color: Theme.of(context).colorScheme.background,
                  panel: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${state.product?.productName ?? "Scan a product"}", style: Theme.of(context).textTheme.headlineMedium),
                              if (state.product != null)
                                ProductNovaScoreCard(novaScore: state.product?.novaGroup, nutraScore: state.product?.nutriscore),
                            ],
                          ),
                          if (state.product != null)
                            Column(
                              children: [
                                Text(
                                  "${state.product?.ingredientsText} kcal",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ),
                                SizedBox(height: 20),
                                SizedBox(
                                  width: double.infinity,
                                  child: Wrap(
                                    runSpacing: 10,
                                    alignment: WrapAlignment.spaceBetween,
                                    runAlignment: WrapAlignment.spaceEvenly,
                                    crossAxisAlignment: WrapCrossAlignment.start,
                                    children: [
                                      NutrientsScoreChip(
                                        icon: FontAwesomeIcons.fire,
                                        value: "${state.product?.nutriments?.getValue(Nutrient.energyKCal, PerSize.serving) ?? 0} kcal",
                                      ),
                                      NutrientsScoreChip(
                                        icon: FontAwesomeIcons.drumstickBite,
                                        value: "${state.product?.nutriments?.getValue(Nutrient.proteins, PerSize.serving)}g protein",
                                      ),
                                      NutrientsScoreChip(
                                        icon: FontAwesomeIcons.leaf,
                                        value: "${state.product?.nutriments?.getValue(Nutrient.carbohydrates, PerSize.serving)}g carbs",
                                      ),
                                      NutrientsScoreChip(
                                        icon: LineIcons.prescriptionBottle,
                                        value: "${state.product?.nutriments?.getValue(Nutrient.fat, PerSize.serving)}g fat",
                                      ),
                                    ],
                                  ),
                                ),
                                DefaultTabController(
                                  length: 2,
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).colorScheme.surface,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        margin: EdgeInsets.only(top: 20),
                                        width: double.infinity,
                                        height: 50,
                                        child: TabBar(
                                          indicatorColor: Theme.of(context).colorScheme.primary,
                                          tabs: [
                                            Tab(
                                              child: Text(
                                                "Nutrients",
                                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            Tab(
                                              child: Text(
                                                "Ingredients",
                                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: MediaQuery.of(context).size.height * .42,
                                        child: TabBarView(
                                          children: [
                                            Column(
                                              children: [],
                                            ),
                                            Column(
                                              children: [],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ));
            },
          ),
          SafeArea(
            child: BasicPageHeader(
              title: "Scan",
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Icon(
                    FontAwesomeIcons.arrowLeftLong,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductNovaScoreCard extends StatelessWidget {
  final int? novaScore;
  final String? nutraScore;
  const ProductNovaScoreCard({
    Key? key,
    required this.novaScore,
    required this.nutraScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Color> novaScoreColorList = [
      Colors.green,
      Colors.yellow,
      Colors.orange,
      Theme.of(context).colorScheme.error,
    ];

    final Map<String, Color> nutraScoreColorMap = {
      "a": Colors.green,
      "b": Colors.yellow,
      "c": Colors.orange,
      "d": Theme.of(context).colorScheme.error,
      "e": Theme.of(context).colorScheme.error,
    };

    return Container(
      decoration: BoxDecoration(
        color: nutraScore != null ? nutraScoreColorMap[nutraScore] : novaScoreColorList[novaScore! - 1],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: nutraScore == ""
          ? Text(
              "${nutraScore?.toUpperCase()}",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onPrimary),
            )
          : Text(
              "${novaScore}",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onPrimary),
            ),
    );
  }
}

class NutrientsScoreChip extends StatelessWidget {
  final IconData icon;
  final String? value;
  const NutrientsScoreChip({
    Key? key,
    required this.icon,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .4,
      child: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Icon(icon, color: Theme.of(context).colorScheme.onBackground)),
          SizedBox(width: 10),
          Text(
            "${value ?? 0}",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
