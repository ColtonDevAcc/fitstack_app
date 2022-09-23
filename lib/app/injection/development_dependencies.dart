import 'package:FitStack/app/injection/core_dependencies.dart';
import 'package:FitStack/app/injection/dependency_injection.dart';

class DevelopmentDependencies extends CoreDependencies {
  @override
  Future<void> init() async {
    print('''it's development time''');

    super.init();
    getIt.registerSingleton<CoreDependencies>(this);
  }
}
