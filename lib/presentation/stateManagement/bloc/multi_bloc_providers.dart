import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/app_bottom_nav_cubit.dart';

class MultiBlocProviders {
  static List<BlocProvider> providers(BuildContext context) => [
        BlocProvider<AppBottomNavCubit>(
            create: (context) => AppBottomNavCubit()),
      ];
}
