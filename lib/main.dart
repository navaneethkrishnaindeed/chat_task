import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'domain/dependency_injection/injectable.dart';
import 'presentation/app.dart';

Future<void> main() async  {
    WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  await configureInjection();
  runApp(const ProviderScope(child: MyApp()));
}