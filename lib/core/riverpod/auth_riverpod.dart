import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neuricax/core/services/auth_service.dart';

final appAuthProvider = ChangeNotifierProvider((ref) => AppAuth(ref));
