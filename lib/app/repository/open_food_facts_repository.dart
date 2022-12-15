import 'package:openfoodfacts/model/OcrIngredientsResult.dart';
import 'package:openfoodfacts/model/ProductResultV3.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/TagType.dart';

class OpenFoodFactsRepository {
  Future<Product?> getProduct({required String barcode}) async {
    final ProductQueryConfiguration configuration =
        ProductQueryConfiguration(barcode, language: OpenFoodFactsLanguage.GERMAN, fields: [ProductField.ALL]);
    final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(configuration);

    if (result.status == 'status ok') {
      return result.product;
    } else {
      throw Exception('product not found, please insert data for $barcode');
    }
  }

  Future<void> addNewProduct() async {
    final Product myProduct = Product(
      barcode: '0048151623426',
      productName: 'Maryland Choc Chip',
    );

    const User myUser = User(userId: 'max@off.com', password: 'password');

    final Status result = await OpenFoodAPIClient.saveProduct(myUser, myProduct);

    if (result.status != 1) {
      throw Exception('product could not be added: ${result.error}');
    }
  }

  Future<void> addProductImage() async {
    final SendImage image = SendImage(
      lang: OpenFoodFactsLanguage.ENGLISH,
      barcode: '0048151623426',
      imageField: ImageField.INGREDIENTS,
      imageUri: Uri.parse('Path to you image'),
    );

    const User myUser = User(userId: 'max@off.com', password: 'password');

    final Status result = await OpenFoodAPIClient.addProductImage(myUser, image);

    if (result.status != 'status ok') {
      throw Exception('image could not be uploaded: ${result.error} ${result.imageId.toString()}');
    }
  }

  Future<String?> extractIngredient() async {
    const User myUser = User(userId: 'max@off.com', password: 'password');

    final OcrIngredientsResult response = await OpenFoodAPIClient.extractIngredients(myUser, '0041220576920', OpenFoodFactsLanguage.ENGLISH);

    if (response.status != 0) {
      throw Exception("Text can't be extracted.");
    }
    return response.ingredientsTextFromImage;
  }

  Future<void> saveAndExtractIngredient() async {
    const User myUser = User(userId: 'max@off.com', password: 'password');

    final SendImage image = SendImage(
      lang: OpenFoodFactsLanguage.FRENCH,
      barcode: '3613042717385',
      imageField: ImageField.INGREDIENTS,
      imageUri: Uri.parse('Path to your image'),
    );

    Status results = await OpenFoodAPIClient.addProductImage(myUser, image);

    if (results.status == null) {
      throw Exception('Adding image failed');
    }

    final OcrIngredientsResult ocrResponse = await OpenFoodAPIClient.extractIngredients(myUser, '3613042717385', OpenFoodFactsLanguage.FRENCH);

    if (ocrResponse.status != 0) {
      throw Exception("Text can't be extracted.");
    }

    results = await OpenFoodAPIClient.saveProduct(myUser, Product(barcode: '3613042717385', ingredientsText: ocrResponse.ingredientsTextFromImage));

    if (results.status != 1) {
      throw Exception('product could not be added');
    }

    final ProductQueryConfiguration configurations = ProductQueryConfiguration(
      '3613042717385',
      language: OpenFoodFactsLanguage.FRENCH,
      fields: [
        ProductField.INGREDIENTS_TEXT,
      ],
    );
    final ProductResultV3 productResult = await OpenFoodAPIClient.getProductV3(configurations, user: myUser);

    if (productResult.status == 'status ok') {
      throw Exception('product not found, please insert data for 3613042717385');
    }
  }

  Future<void> getSuggestions() async {
    await OpenFoodAPIClient.getAutocompletedSuggestions(TagType.COUNTRIES, input: 'Tun', language: OpenFoodFactsLanguage.FRENCH);
  }
}
