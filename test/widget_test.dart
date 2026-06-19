import 'package:excelerate_connect/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('user can load JSON programs and submit registration',
      (tester) async {
    await tester.pumpWidget(const ExcelerateConnectApp());

    expect(find.text('Excelerate Connect'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);

    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    expect(find.text('Welcome back'), findsOneWidget);
    expect(find.text('Announcements'), findsOneWidget);

    await tester.tap(find.text('Browse Programs'));
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.text('Programs'), findsOneWidget);
    expect(find.text('Career Accelerator Bootcamp'), findsOneWidget);

    await tester.tap(find.text('Career Accelerator Bootcamp'));
    await tester.pumpAndSettle();

    expect(find.text('Program Details'), findsOneWidget);
    expect(find.text('Register Now'), findsOneWidget);
    expect(find.text('Learning Outcomes'), findsOneWidget);

    await tester.tap(find.text('Register Now'));
    await tester.pumpAndSettle();

    expect(find.text('Program Registration'), findsOneWidget);
    expect(find.text('Submit Registration'), findsOneWidget);

    await tester.tap(find.text('Submit Registration'));
    await tester.pumpAndSettle();

    expect(find.text('Full name is required'), findsOneWidget);
    expect(find.text('Email address is required'), findsOneWidget);
    expect(find.text('Password is required'), findsOneWidget);

    await tester.enterText(find.byType(EditableText).at(0), 'Deepak Sharma');
    await tester.enterText(find.byType(EditableText).at(1), 'deepak@example.com');
    await tester.enterText(find.byType(EditableText).at(2), 'secret1');
    await tester.enterText(
      find.byType(EditableText).at(3),
      'I want to build practical internship skills.',
    );

    await tester.tap(find.text('Submit Registration'));
    await tester.pump();
    expect(find.text('Submitting'), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.text('Registered'), findsOneWidget);
    expect(
      find.text('Registration submitted for Career Accelerator Bootcamp'),
      findsOneWidget,
    );
  });
}
