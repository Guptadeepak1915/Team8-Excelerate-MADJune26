import 'package:excelerate_connect/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('user can navigate and register for a program', (tester) async {
    await tester.pumpWidget(const ExcelerateConnectApp());

    expect(find.text('Excelerate Connect'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);

    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    expect(find.text('Welcome back'), findsOneWidget);
    expect(find.text('Announcements'), findsOneWidget);

    await tester.tap(find.text('Browse Programs'));
    await tester.pumpAndSettle();

    expect(find.text('Programs'), findsOneWidget);
    expect(find.text('Career Accelerator Bootcamp'), findsOneWidget);

    await tester.tap(find.text('Career Accelerator Bootcamp'));
    await tester.pumpAndSettle();

    expect(find.text('Program Details'), findsOneWidget);
    expect(find.text('Register Now'), findsOneWidget);

    await tester.tap(find.text('Register Now'));
    await tester.pumpAndSettle();

    expect(find.text('Registered'), findsOneWidget);
    expect(
      find.text('Registered for Career Accelerator Bootcamp'),
      findsOneWidget,
    );
  });
}
