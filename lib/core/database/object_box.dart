import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sample_app/objectbox.g.dart';

class ObjectBox {
  late final Store store;

  ObjectBox._create(this.store);

  static Future<ObjectBox> create() async {
    final Directory docsDir = await getApplicationDocumentsDirectory();

    final String storePath = path.join(
      docsDir.path,
      "app",
    );

    if (Store.isOpen(storePath)) {
      final Store store = Store.attach(
        getObjectBoxModel(),
        storePath,
      );

      return ObjectBox._create(store);
    }

    final Store store = await openStore(
      directory: storePath,
    );

    return ObjectBox._create(store);
  }
}
