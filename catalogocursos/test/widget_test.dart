import 'package:flutter_test/flutter_test.dart';

import 'package:catalogocursos/main.dart';

void main() {
  testWidgets('App renders smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.text('Catálogo de Cursos'), findsWidgets);
  });
}
