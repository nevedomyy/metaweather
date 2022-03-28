import 'package:flutter/material.dart';
import 'package:metaweather/features/forecast/logic/forecast_notifier.dart';
import 'package:provider/provider.dart' show Consumer;

class ForecastButton extends StatelessWidget {
  final VoidCallback? onTap;

  const ForecastButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      child: Consumer<ForecastNotifier>(
        builder: (context, state, child) {
          return state.isLoading
              ? const CircularProgressIndicator()
              : const Icon(Icons.air, size: 30);
        },
      ),
    );
  }
}
