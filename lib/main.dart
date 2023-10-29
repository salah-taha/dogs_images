import 'package:device_preview/device_preview.dart';
import 'package:dogs_images/core/app/app.dart';
import 'package:dogs_images/service_locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main({bool isTest = false}) async {
  WidgetsFlutterBinding.ensureInitialized();
  sl.allowReassignment = true;
  await registerServices(isTest: isTest);
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) {
        return const App();
      },
    ),
  );
}
