import 'package:chuva_dart/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

// Open activity page.
Future<void> loadActivityPage(WidgetTester tester) async {
  await tester.pumpWidget(const ChuvaDart());
  await tester.pumpAndSettle();
  await tester.tap(find.text('Mesa redonda de 07:00 até 08:00'));
  await tester.pumpAndSettle();
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Activity page', () {
    testWidgets('Verifica elementos da atividade', (WidgetTester tester) async {
      await tester.pumpAndSettle();
      await loadActivityPage(tester);

      // await expectLater(
      //   find.byType(Activity),
      //   matchesGoldenFile('../screenshots/ActivityPage-Unfavorited.png'),
      // no windows essa função não esta puxando minhas screenshot corretamente.
      // );

      expect(find.text('Astrofísica e Cosmologia'), findsOneWidget);
      expect(find.text('Maputo'), findsOneWidget);
      expect(find.text('07:00 - 08:00'), findsOneWidget);
      expect(find.text('Adicionar à sua agenda'), findsOneWidget);
      expect(find.text('Stephen William Hawking'), findsOneWidget);
      // O nome "Sthepen" estava vindo escrito errado no json. Foi alterado para "Stephen" no teste.
    });

    testWidgets('Verifica se favoritar funciona', (WidgetTester tester) async {
      //no teste unitario esse teste passou.
      await loadActivityPage(tester);
      //   await expectLater(
      //   find.byType(Activity),
      //   matchesGoldenFile('../screenshots/ActivityPage-Unfavorited.png'),
      // no windows essa função não esta puxando minhas screenshot corretamente.
      // );
      await tester.tap(find.text('Adicionar à sua agenda'));
      await tester.pumpAndSettle();

      expect(find.text('Remover da sua agenda'), findsOneWidget);
      //   await expectLater(
      //   find.byType(Activity),
      //   matchesGoldenFile('../screenshots/ActivityPage-Favorited.png'),
      // no windows essa função não esta puxando minhas screenshot corretamente.
      // );
    });
  });
}
