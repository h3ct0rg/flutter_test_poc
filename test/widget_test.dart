import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_cat_web/main.dart'; // Asegúrate de importar el archivo correcto

void main() {
  testWidgets('Formulario de registro de gatito', (WidgetTester tester) async {
    // Carga la aplicación.
    await tester.pumpWidget(MyApp());

    // Encuentra los campos del formulario y los botones.
    final nombreField = find.byKey(Key('nombreField'));
    final razaDropdown = find.byKey(Key('razaDropdown'));
    final edadField = find.byKey(Key('edadField'));
    final colorField = find.byKey(Key('colorField'));
    final saveButton = find.byKey(Key('saveButton'));

    // Interactúa con los campos del formulario.
    await tester.enterText(nombreField, 'Gato');
    await tester.enterText(edadField, '3');
    await tester.enterText(colorField, 'Gris');
    await tester.tap(razaDropdown);
    await tester.pump();
    await tester.tap(find.text('Siamés'));
    await tester.pump();
    await tester.tap(saveButton);
    await tester.pump();

    // Verifica que el formulario haya sido guardado correctamente.
    expect(find.text('Gatito registrado con éxito'), findsOneWidget);
  });
}
