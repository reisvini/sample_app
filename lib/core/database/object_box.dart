import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sample_app/objectbox.g.dart';

class ObjectBox {
  late final Store store;

  ObjectBox._create(this.store);

  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(
      directory: path.join(
        docsDir.path,
        "contacts",
      ),
    );

    return ObjectBox._create(store);
  }
}
