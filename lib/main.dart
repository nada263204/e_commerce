import 'package:ecommerce/core/app_bloc_observer.dart';
import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/ecommerce_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  configureDependencies();

  runApp(const ECommerceApp());
}
