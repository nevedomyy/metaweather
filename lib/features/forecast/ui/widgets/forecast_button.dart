import 'package:flutter/material.dart';
import 'package:metaweather/features/forecast/logic/forecast_notifier.dart';
import 'package:provider/provider.dart';

class ForecastButton extends StatelessWidget {
  final VoidCallback? onTap;

  const ForecastButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<ForecastNotifier>().isLoading;

    return FloatingActionButton(
      onPressed: onTap,
      child: isLoading
          ? const CircularProgressIndicator()
          : const Icon(Icons.air, size: 30),
    );
  }
}
