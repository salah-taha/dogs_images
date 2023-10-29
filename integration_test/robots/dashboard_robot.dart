import 'dart:io';

import 'package:dogs_images/core/constants/widget_keys.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

class DashboardRobot {
  const DashboardRobot(this.tester);

  final WidgetTester tester;

  Future<void> findTitle() async {
    await tester.pumpAndSettle();
    expect(find.text('Dogs App Demo'), findsOneWidget);
    sleep(const Duration(seconds: 2));
  }

  Future<void> findBreedsDropdown() async {
    await tester.pumpAndSettle();
    expect(find.byKey(ValueKey(WidgetKeys.breedDropdown)), findsOneWidget);
    sleep(const Duration(seconds: 2));
  }

  Future<void> findTypeDropdown() async {
    await tester.pumpAndSettle();
    expect(find.byKey(ValueKey(WidgetKeys.dashboardTypeDropdown)), findsOneWidget);
    sleep(const Duration(seconds: 2));
  }

  Future<void> findSubBreedsDropdown() async {
    await tester.pumpAndSettle();
    expect(find.byKey(ValueKey(WidgetKeys.subBreedDropdown)), findsOneWidget);
    sleep(const Duration(seconds: 2));
  }

  Future<void> selectBreed(String breed) async {
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(ValueKey(WidgetKeys.breedDropdown)));
    await tester.pumpAndSettle();
    await tester.tap(find.text(breed));
    await tester.pumpAndSettle();
    sleep(const Duration(seconds: 2));
  }

  Future<void> selectType(String type) async {
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(ValueKey(WidgetKeys.dashboardTypeDropdown)));
    await tester.pumpAndSettle();
    await tester.tap(find.text(type));
    await tester.pumpAndSettle();
    sleep(const Duration(seconds: 2));
  }

  Future<void> selectSubBreed(String subBreed) async {
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(ValueKey(WidgetKeys.subBreedDropdown)));
    await tester.pumpAndSettle();
    await tester.tap(find.text(subBreed));
    await tester.pumpAndSettle();
    sleep(const Duration(seconds: 2));
  }

  Future<void> findImage() async {
    await tester.pumpAndSettle();
    expect(find.byKey(ValueKey(WidgetKeys.dogImageWidget)), findsOneWidget);
    sleep(const Duration(seconds: 2));
  }

  Future<void> findErrorMessage({String? error}) async {
    await tester.pumpAndSettle();
    if (error != null) {
      expect(find.text(error), findsOneWidget);
    } else {
      expect(find.byKey(ValueKey(WidgetKeys.errorMessage)), findsOneWidget);
    }

    sleep(const Duration(seconds: 2));
  }

  // find images grid
  Future<void> findImagesGrid() async {
    await tester.pumpAndSettle();
    expect(find.byKey(ValueKey(WidgetKeys.dogImageGridWidget)), findsOneWidget);
    sleep(const Duration(seconds: 2));
  }
}
