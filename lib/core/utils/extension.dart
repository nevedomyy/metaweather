import 'package:flutter/material.dart' show BuildContext, MediaQuery, Size;
import 'package:metaweather/core/api/api_provider.dart';
import 'package:metaweather/core/injections/dependencies.dart';
import 'package:metaweather/core/services/storage.dart';

extension BuildContextExtension on BuildContext {
  /// size => MediaQuery.of(this).size
  Size get size => MediaQuery.of(this).size;

  /// height => MediaQuery.of(this).size.height
  double get height => MediaQuery.of(this).size.height;

  /// width => MediaQuery.of(this).size.width
  double get width => MediaQuery.of(this).size.width;

  /// dependencies => AppDependencies.of(this)
  AppDependencies get dependencies => AppDependencies.of(this);

  /// apiProvider => AppDependencies.of(this).apiProvider
  ApiProvider get apiProvider => AppDependencies.of(this).apiProvider;

  /// storage => AppDependencies.of(this).storage
  AppStorage get storage => AppDependencies.of(this).storage;
}
