import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neuricax/core/services/scan_service.dart';

final scanProvider = ChangeNotifierProvider((ref) => ScanImage());
