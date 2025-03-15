import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      runApp(await builder());
    },
    (error, stack) => log('$error', name: 'Error', stackTrace: stack),
  );
}
