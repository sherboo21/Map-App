import 'package:flutter/material.dart';
import '../utils/app_imports.dart';

class FlutterMap extends StatelessWidget {
  const FlutterMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: MultiBlocProviders.providers(context),
      child: ScreenUtilInit(
        designSize: const Size(360, 812),
        builder: (context, child) => GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: MaterialApp(
            initialRoute: Routes.layOut,
            onGenerateRoute: NamedNavigatorImpl.onGenerateRoute,
            navigatorKey: NamedNavigatorImpl.navigatorState,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Map',
            theme: AppTheme.lightThemeData,
          ),
        ),
      ),
    );
  }
}