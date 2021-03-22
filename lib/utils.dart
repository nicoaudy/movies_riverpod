import 'package:flutter_riverpod/flutter_riverpod.dart';

class Utils {
  final movieApiKey = '';
}

final environmentConfigProvider = Provider<Utils>((ref) {
  return Utils();
});
