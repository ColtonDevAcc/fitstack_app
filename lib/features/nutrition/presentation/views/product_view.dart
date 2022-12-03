import 'package:FitStack/features/nutrition/presentation/atoms/nutrients_score_chip.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:openfoodfacts/model/Product.dart';

class ProductView extends StatelessWidget {
  final Product product;
  const ProductView({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
                  child: AutoSizeText(
                    "Nutrients",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: AutoSizeText(
                    "Ingredients",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: AutoSizeText(
                    "Images",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: TabBarView(
              children: [
                CustomScrollView(
                  scrollDirection: Axis.vertical,
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: true,
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: product.nutriments?.toJson().entries.map((e) {
                              return NutrientsScoreChip(
                                icon: IngredientsToIcon[e.key.split("_")[0]] ?? FontAwesome.fire,
                                value: "${e.value} ${e.key}",
                              );
                            }).toList() ??
                            [],
                      ),
                    )
                  ],
                ),
                CustomScrollView(
                  scrollDirection: Axis.vertical,
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: true,
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          if (product.ingredients != null && product.ingredients!.isNotEmpty)
                            for (var i = 0; i < product.ingredients!.length; i++)
                              NutrientsScoreChip(
                                icon: IngredientsToIcon[product.ingredients?[i].text] ?? FontAwesome.question,
                                value: product.ingredients?[i].text ?? "",
                              ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Text("Additives", style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                          ),
                          if (product.additives != null && product.additives!.names.isNotEmpty)
                            for (var i = 0; i < product.additives!.names.length; i++)
                              NutrientsScoreChip(
                                icon: IngredientsToIcon[product.additives?.names[i]] ?? FontAwesomeIcons.pills,
                                value: product.additives?.names[i] ?? "",
                              ),
                        ],
                      ),
                    )
                  ],
                ),
                CustomScrollView(
                  scrollDirection: Axis.vertical,
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: true,
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          if (product.images != null && product.images!.isNotEmpty)
                            for (var i = 0; i < product.images!.length; i++)
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.surface,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(product.images![i].url ?? ""),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const Map<String, IconData> IngredientsToIcon = {
  "natural flavors": FontAwesome.leaf,
  "polysorbate 80": FontAwesome.pills,
  "turmeric": FontAwesome.plant_wilt,
  "red pepper": FontAwesome.pepper_hot,
  "preservative": FontAwesome.pills,
  "color": FontAwesome.pills,
  "cucumbers": FontAwesomeIcons.cucumber,
  "tomatoes": FontAwesomeIcons.tomato,
  "onions": FontAwesomeIcons.onion,
  "garlic": FontAwesomeIcons.garlic,
  "water": FontAwesomeIcons.glassWaterDroplet,
  "salt": FontAwesomeIcons.saltShaker,
  "sugar": FontAwesomeIcons.candy,
  "vinegar": FontAwesomeIcons.wineBottle,
  "olive oil": FontAwesomeIcons.oilCan,
  "vegetable oil": FontAwesomeIcons.oilCan,
  "canola oil": FontAwesomeIcons.oilCan,
  "sunflower oil": FontAwesomeIcons.oilCan,
  "soybean oil": FontAwesomeIcons.oilCan,
  "corn oil": FontAwesomeIcons.oilCan,
  "peanut oil": FontAwesomeIcons.oilCan,
  "sesame oil": FontAwesomeIcons.oilCan,
  "coconut oil": FontAwesomeIcons.oilCan,
  "palm oil": FontAwesomeIcons.oilCan,
  "palm kernel oil": FontAwesomeIcons.oilCan,
  "calcium chloride": FontAwesomeIcons.saltShaker,
  "sodium benzoate": FontAwesomeIcons.saltShaker,
  "spices": FontAwesomeIcons.pepperHot,
  "citric acid": FontAwesomeIcons.lemon,
  "milk": FontAwesomeIcons.cow,
  "whey": FontAwesomeIcons.cow,
  "milk protein concentrate": FontAwesomeIcons.cow,
  "milk protein isolate": FontAwesomeIcons.cow,
  "sodium": FontAwesomeIcons.saltShaker,
  "fiber": FontAwesomeIcons.seedling,
  "sugars": FontAwesomeIcons.candy,
  "fat": FontAwesomeIcons.oilCan,
  "saturated-fat": FontAwesomeIcons.oilCanDrip,
  "proteins": FontAwesomeIcons.drumstickBite,
  "energy-kcal": FontAwesomeIcons.fire,
  "energy-kj": FontAwesomeIcons.fire,
  "carbohydrates": FontAwesomeIcons.breadSlice,
  "calcium": FontAwesomeIcons.egg,
  "iron": FontAwesomeIcons.steak,
  "vitamin-a": FontAwesomeIcons.egg,
  "vitamin-c": FontAwesomeIcons.tomato,
  "vitamin-d": FontAwesomeIcons.fish,
  "vitamin-e": FontAwesomeIcons.wheat,
  "vitamin-k": FontAwesomeIcons.leaf,
  "cholesterol": FontAwesomeIcons.egg,
  "trans-fat": FontAwesomeIcons.oilCanDrip,
  "sodium chloride": FontAwesomeIcons.saltShaker,
};
