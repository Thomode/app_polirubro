import 'package:app_polirubro/providers/dark_theme_provider.dart';
import 'package:app_polirubro/screens/login/forgot_password_screen.dart';
import 'package:app_polirubro/screens/product/form_product_screen.dart';
import 'package:app_polirubro/screens/login/login_screen.dart';
import 'package:app_polirubro/screens/product/image_full_screen.dart';
import 'package:app_polirubro/screens/product/product_screen.dart';
import 'package:app_polirubro/screens/login/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DarkThemeProvider())
      ],
      child: const AppPolirubro()
  ));
}

final _routes = GoRouter(
    initialLocation: "/login",
    routes: <RouteBase>[
      GoRoute(
          path: "/login",
          builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: "/register",
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: "/forgot-password",
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
          path: "/product",
          builder: (context, state) => const ProductScreen(),
      ),
      GoRoute(
        path: "/form-product",
        builder: (context, state) => const FormProductScreen(),
      ),
      GoRoute(
        path: "/image-full",
        builder: (context, state) {
          final url = state.queryParameters["url"];

          return ImageFullScreen(imageUrl: url);
        },
      )
    ]
);

class AppPolirubro extends StatefulWidget {
  const AppPolirubro({super.key});

  @override
  State<AppPolirubro> createState() => _AppPolirubroState();
}

class _AppPolirubroState extends State<AppPolirubro> {
  @override
  void initState() {
    super.initState();
    Provider.of<DarkThemeProvider>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    final DarkThemeProvider darkThemeProvider = Provider.of<DarkThemeProvider>(context);

    return MaterialApp.router(
      title: 'App Polirubro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light
      ),
      darkTheme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark
      ),
      themeMode: darkThemeProvider.darkTheme? ThemeMode.dark : ThemeMode.light,
      routerConfig: _routes,
    );
  }
}





