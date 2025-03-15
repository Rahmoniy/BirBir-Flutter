import 'package:bir_bir/pages/add_new/cubit/add_product_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../assets/app_colors.dart';
import 'package:bir_bir/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await Supabase.initialize(
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpxaGxsbmdsbGF1YWN1ZmlrdmhrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDExMzI0NjksImV4cCI6MjA1NjcwODQ2OX0.q-RFRV_4TT-ne3rYcaJFYF68yVw1FGSGIe6kEkxCD6I',
    url: 'https://zqhllngllauacufikvhk.supabase.co',
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AddProductCubit(),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: Routing.router,
          title: "Go router",
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.lightGrey,
            primaryColor: AppColors.primary,
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: AppColors.lightGrey),
          ),
        ));
  }
}
