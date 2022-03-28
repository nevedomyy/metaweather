import 'package:flutter/material.dart';
import 'package:provider/provider.dart'
    show ChangeNotifierProvider, MultiProvider;

import 'package:metaweather/features/forecast/repositories/forecast_repository.dart';
import 'package:metaweather/features/forecast/logic/forecast_notifier.dart';
import 'package:metaweather/core/services/logger.dart';
import 'package:metaweather/core/utils/extension.dart';

class AppProviders extends StatefulWidget {
  final Widget child;

  const AppProviders({Key? key, required this.child}) : super(key: key);

  @override
  State<AppProviders> createState() => _AppProvidersState();
}

class _AppProvidersState extends State<AppProviders> {
  @override
  void dispose() {
    log.close();
    context.dependencies.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ForecastNotifierImpl(
            repository: ForecastRepositoryImpl(
              apiProvider: context.apiProvider,
              storage: context.storage,
            ),
          ),
        ),
      ],
      child: widget.child,
    );
  }
}
