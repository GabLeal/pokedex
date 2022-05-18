flutter test --coverage &&
lcov --remove coverage/lcov.info 'lib/settings/*' 'lib/presentation/*/view/*' 'lib/presentation/components/*' 'lib/*/components/*' 'lib/*/widgets/*' 'lib/*/widget/*' -o coverage/new_lcov.info &&
genhtml coverage/new_lcov.info --output=coverage &&
open coverage/index.html