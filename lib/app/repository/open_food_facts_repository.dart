import 'package:openfoodfacts/model/OcrIngredientsResult.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/TagType.dart';

class OpenFoodFactsRepository {
  Future<Product?> getProduct({required String barcode}) async {
    ProductQueryConfiguration configuration = ProductQueryConfiguration(barcode, language: OpenFoodFactsLanguage.GERMAN, fields: [ProductField.ALL]);
    ProductResult result = await OpenFoodAPIClient.getProduct(configuration);

    if (result.status == 1) {
      return result.product;
    } else {
      throw Exception('product not found, please insert data for $barcode');
    }
  }

  void addNewProduct() async {
    Product myProduct = Product(
      barcode: '0048151623426',
      productName: 'Maryland Choc Chip',
    );

    User myUser = User(userId: 'max@off.com', password: 'password');

    Status result = await OpenFoodAPIClient.saveProduct(myUser, myProduct);

    if (result.status != 1) {
      throw Exception('product could not be added: ${result.error}');
    }
  }

  void addProductImage() async {
    SendImage image = SendImage(
      lang: OpenFoodFactsLanguage.ENGLISH,
      barcode: '0048151623426',
      imageField: ImageField.INGREDIENTS,
      imageUri: Uri.parse('Path to you image'),
    );

    User myUser = User(userId: 'max@off.com', password: 'password');

    Status result = await OpenFoodAPIClient.addProductImage(myUser, image);

    if (result.status != 'status ok') {
      throw Exception('image could not be uploaded: ${result.error} ${result.imageId.toString()}');
    }
  }

  Future<String?> extractIngredient() async {
    User myUser = User(userId: 'max@off.com', password: 'password');

    OcrIngredientsResult response = await OpenFoodAPIClient.extractIngredients(myUser, '0041220576920', OpenFoodFactsLanguage.ENGLISH);

    if (response.status != 0) {
      throw Exception("Text can't be extracted.");
    }
    return response.ingredientsTextFromImage;
  }

  void saveAndExtractIngredient() async {
    User myUser = User(userId: 'max@off.com', password: 'password');

    SendImage image = SendImage(
      lang: OpenFoodFactsLanguage.FRENCH,
      barcode: '3613042717385',
      imageField: ImageField.INGREDIENTS,
      imageUri: Uri.parse('Path to your image'),
    );

    Status results = await OpenFoodAPIClient.addProductImage(myUser, image);

    if (results.status == null) {
      throw Exception('Adding image failed');
    }

    OcrIngredientsResult ocrResponse = await OpenFoodAPIClient.extractIngredients(myUser, '3613042717385', OpenFoodFactsLanguage.FRENCH);

    if (ocrResponse.status != 0) {
      throw Exception("Text can't be extracted.");
    }

    results = await OpenFoodAPIClient.saveProduct(myUser, Product(barcode: '3613042717385', ingredientsText: ocrResponse.ingredientsTextFromImage));

    if (results.status != 1) {
      throw Exception('product could not be added');
    }

    ProductQueryConfiguration configurations = ProductQueryConfiguration('3613042717385', language: OpenFoodFactsLanguage.FRENCH, fields: [
      ProductField.INGREDIENTS_TEXT,
    ]);
    ProductResult productResult = await OpenFoodAPIClient.getProduct(configurations, user: myUser);

    if (productResult.status != 1) {
      throw Exception('product not found, please insert data for 3613042717385');
    }
  }

  void getSuggestions() async {
    await OpenFoodAPIClient.getAutocompletedSuggestions(TagType.COUNTRIES, input: 'Tun', language: OpenFoodFactsLanguage.FRENCH);
  }
}
