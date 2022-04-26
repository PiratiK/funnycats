import 'package:flutter/material.dart';
import 'package:funnycats/data/models/cat_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/application.dart';

Future<void> main(List<String> args) async {
  await Hive.initFlutter();
  Hive.registerAdapter(CatAdapter());
  runApp(Application());
}
