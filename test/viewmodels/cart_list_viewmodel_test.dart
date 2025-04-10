import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_tecnica/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('CartListViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
