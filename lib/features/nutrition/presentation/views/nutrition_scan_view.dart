import 'package:FitStack/app/providers/bloc/nutrition/nutrition_bloc.dart';
import 'package:FitStack/features/nutrition/presentation/atoms/product_nova_score_card.dart';
import 'package:FitStack/features/nutrition/presentation/atoms/product_nutrients_snapshot.dart';
import 'package:FitStack/features/nutrition/presentation/views/product_view.dart';
import 'package:FitStack/widgets/atoms/basic_view_header.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
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
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                color: Theme.of(context).colorScheme.background,
                collapsed: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Center(
                    child: AutoSizeText(
                      "Scan a product",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ),
                panel: Scaffold(
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      context.read<NutritionBloc>().add(AddProductToHistory(product: state.product!));
                      context.go("/nutrition");
                    },
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: const Icon(FontAwesomeIcons.plus),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.background,
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        height: 5,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.4),
                          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Scrollbar(
                            child: CustomScrollView(
                              slivers: [
                                SliverToBoxAdapter(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(right: 10.0),
                                              child: AutoSizeText(
                                                state.product?.productName ?? "Scan a product",
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context).textTheme.headlineMedium,
                                              ),
                                            ),
                                          ),
                                          if (state.product != null)
                                            ProductNovaScoreCard(novaScore: state.product?.novaGroup, nutraScore: state.product?.nutriscore),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SliverFillRemaining(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      if (state.product != null)
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              state.product?.ingredientsText ?? "no ingredients listed",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context).textTheme.headlineSmall,
                                            ),
                                            const SizedBox(height: 20),
                                            ProductNutrientsSnapshot(nutrients: state.product?.nutriments),
                                          ],
                                        ),
                                      if (state.product != null) Expanded(child: ProductView(product: state.product!)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
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
                    FontAwesome.arrow_left_long,
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
