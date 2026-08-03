import 'package:flutter_test/flutter_test.dart';
import 'package:pubsec/main.dart';

void main() {
  testWidgets('App deve exibir Clima Agora no banner', (WidgetTester tester) async {
    await tester.pumpWidget(MeuApp());
    expect(find.text('Clima Agora'), findsWidgets);
  });
}
