import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver? driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() async {
    if (driver != null) {
      driver!.close();
    }
  });

  test('simple test', () async {
    print("simple test start");
    final textFinder = find.byValueKey('registerButton');
    await driver!.waitFor(textFinder);
    await driver!.waitForTappable(textFinder);
  });

  test('test fail register', () async {
    print("test fail register start");
    if (driver == null) {
      throw Exception('Driver not initialized');
    }

    final firstNameField = find.byValueKey('nombreField');
    final razaDD = find.byValueKey('razaDropdown');
    final edadField = find.byValueKey('edadField');
    final colorField = find.byValueKey('colorField');
    final saveButton = find.byValueKey('saveButton');
    final registerButton = find.byValueKey('registerButton');

    print('entre a los tests');
    await driver!.tap(registerButton);
    await driver!.tap(firstNameField);
    await driver!.enterText('Doe');
    await driver!.tap(saveButton);

    expect(
        await driver!
            .getText(find.text("Por favor, completa todos los campos")),
        'Por favor, completa todos los campos');
  });

  test('test success register', () async {
    print("test success register start");
    if (driver == null) {
      throw Exception('Driver not initialized');
    }

    final firstNameField = find.byValueKey('nombreField');
    final razaDD = find.byValueKey('razaDropdown');
    final edadField = find.byValueKey('edadField');
    final colorField = find.byValueKey('colorField');
    final saveButton = find.byValueKey('saveButton');
    final registerButton = find.byValueKey('registerButton');

    print('entre a los tests');
    await driver!.tap(firstNameField);
    await driver!.enterText('Doe');
    print((await driver!.getText(firstNameField)));
    await driver!.tap(edadField);
    await driver!.enterText('2');
    print((await driver!.getText(edadField)));
    await driver!.tap(razaDD);
    await driver!.tap(find.text('Siamés'));
    await driver!.tap(colorField);
    await driver!.enterText('Black');
    await driver!.tap(saveButton);

    expect(
        await driver!
            .getText(find.text("Por favor, completa todos los campos")),
        'Por favor, completa todos los campos');
  });
}
