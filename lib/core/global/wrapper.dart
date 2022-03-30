import 'package:flutter/material.dart';
import 'package:metaweather/core/models/app_response.dart';
import 'package:metaweather/core/services/logger.dart';

import 'keys.dart';

class AppChangeNotifier extends ChangeNotifier {
  bool _isLoading = false;

  Future<void> funcWithLoader(
    Future<void> Function() function,
  ) async {
    _isLoading = true;
    notifyListeners();
    await function();
    _isLoading = false;
    notifyListeners();
  }

  void showSnackBar(String message) {
    Keys.snackbarKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  bool get isLoading => _isLoading;
}

Future<AppResponse> tryCatchResponse(
  Future<dynamic> Function() function,
) async {
  try {
    final data = await function();
    return AppResponse.success(data);
  } on Exception catch (e, s) {
    return AppResponse.withError(e, s);
  }
}

Future<void> tryCatchVoid(
  Future<void> Function() function,
) async {
  try {
    await function();
  } on Exception catch (e) {
    log.w(e.toString());
  }
}
