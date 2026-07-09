import 'package:flutter_test/flutter_test.dart';

import 'package:lanchoneteexpress/main.dart';

void main() {
  testWidgets('App renders smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.text('Lanchonete Express'), findsWidgets);
  });
}
