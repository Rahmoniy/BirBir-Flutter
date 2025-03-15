import 'package:bir_bir/models/product_model.dart';
import 'package:bir_bir/pages/add_new/add_new.dart';
import 'package:bir_bir/pages/add_new_name/add_new_name.dart';
import 'package:bir_bir/pages/add_new_price/add_new_price.dart';
import 'package:bir_bir/pages/auth/register.dart';
import 'package:bir_bir/pages/category_detail/category_detail.dart';
import 'package:bir_bir/pages/error/error.dart';
import 'package:bir_bir/pages/launch/launch.dart';
import 'package:bir_bir/pages/product_detail/view/product_detail_view.dart';
import 'package:bir_bir/pages/search/view/search_view.dart';
import 'package:bir_bir/pages/tabs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bir_bir/pages/product_detail/product_detail.dart';

class Routing {
  static final Routing _instance = Routing._internal();

  factory Routing() {
    return _instance;
  }

  BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: "/launch",
        builder: (context, state) => const Launch(),
      ),
      GoRoute(
        path: "/register",
        builder: (context, state) => const Register(),
      ),
      GoRoute(
        path: "/search",
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: "/",
        builder: (context, state) => const TabsScreen(),
      ),
      GoRoute(
        path: "/product_detail",
        builder: (context, state) {
          final product = state.extra as ProductModel;
          return ProductDetailView(product: product);
        },
      ),
      GoRoute(
        path: "/add_new",
        builder: (context, state) => const AddNew(),
      ),
      GoRoute(
        path: "/add_new_name",
        builder: (context, state) => const AddNewName(),
      ),
      GoRoute(
        path: "/add_new_price",
        builder: (context, state) => const AddNewPrice(),
      ),
      GoRoute(
        path: "/category_product",
        builder: (context, state) {
          final category = state.extra as String;
          return CategoryDetail(categoryName: category);
        },
      ),
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(child: ErrorPage());
    },
  );

  Routing._internal();
}
