import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_app/config/router/app_router.dart';
import 'package:notification_app/config/theme/app_theme.dart';
import 'package:notification_app/presentation/blocs/notifications/notifications_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => NotificationsBloc())],
      child: MainApp(),
    ),
  );
  // const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,

      routerConfig: appRouter,
    );
  }
}
