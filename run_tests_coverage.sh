flutter test --coverage &&
lcov --remove coverage/lcov.info 'lib/layers/presentation/stores/*.g.dart'  -o coverage/new_lcov.info &&
genhtml coverage/new_lcov.info --output=coverage &&
open coverage/index.html