import 'package:dogs_images/modules/dashboard/domain/enums/dashboard_type.dart';
import 'package:dogs_images/modules/dashboard/presentation/validation/validation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:dogs_images/main.dart' as app;
import 'robots/dashboard_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  DashboardRobot dashboardRobot;

  group('e2e test', () {
    testWidgets('Typical User Flow', (tester) async {
      app.main(isTest: true);
      dashboardRobot = DashboardRobot(tester);
      await tester.pumpAndSettle();
      await dashboardRobot.findTitle();
      await dashboardRobot.findBreedsDropdown();
      await dashboardRobot.selectBreed('affenpinscher');
      await dashboardRobot.findImage();
      await dashboardRobot.findTypeDropdown();
      await dashboardRobot.selectType(DashboardType.imagesListByBreed.valueName);
      await dashboardRobot.findImagesGrid();
      await dashboardRobot.selectType(DashboardType.randomImageBySubBreed.valueName);
      await dashboardRobot.findErrorMessage(error: const NoSubBreedsWarning().message);
      await dashboardRobot.selectBreed('australian');
      await dashboardRobot.findErrorMessage(error: const SelectSubBreedWarning().message);
      await dashboardRobot.selectSubBreed('shepherd');
      await dashboardRobot.findImage();
      await dashboardRobot.selectType(DashboardType.imagesListBySubBreed.valueName);
      await dashboardRobot.findImagesGrid();
    });
  });
}
