import 'package:dogs_images/modules/dashboard/presentation/dashboard_screen.dart';
import 'package:dogs_images/service_locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../integration_test/robots/dashboard_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  DashboardRobot dashboardRobot;

  setUpAll(() {
    registerServices(isTest: true);
  });

  group('e2e test', () {
    testWidgets('whole app', (widgetTester) async {
      dashboardRobot = DashboardRobot(widgetTester);
      await widgetTester.pumpWidget(const DashboardScreen());
      await dashboardRobot.findTitle();
    });
  });
}
