import 'package:app_polirubro/providers/auth_provider.dart';
import 'package:app_polirubro/providers/dark_theme_provider.dart';
import 'package:app_polirubro/screens/auth/forgot_password_screen.dart';
import 'package:app_polirubro/screens/product/form_product_screen.dart';
import 'package:app_polirubro/screens/auth/login_screen.dart';
import 'package:app_polirubro/screens/product/image_full_screen.dart';
import 'package:app_polirubro/screens/product/product_screen.dart';
import 'package:app_polirubro/screens/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => DarkThemeProvider()), ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: const AppPolirubro()));
}

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
    Provider.of<AuthProvider>(context, listen: false).checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    final DarkThemeProvider darkThemeProvider = Provider.of<DarkThemeProvider>(context);
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);

    final GoRouter router = GoRouter(
      initialLocation: authProvider.isAuthenticated? '/product': '/',
      routes: <RouteBase>[
        GoRoute(
          path: "/",
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
          redirect: (context, state) {
            if (!authProvider.isAuthenticated) {
              return '/';
            }
            return null;
          },
        ),
        GoRoute(
          path: "/form-product",
          builder: (context, state) => const FormProductScreen(),
          redirect: (context, state) {
            if (!authProvider.isAuthenticated) {
              return '/';
            }
            return null;
          },
        ),
        GoRoute(
          path: "/image-full",
          builder: (context, state) {
            final url = state.queryParameters["url"];
            return ImageFullScreen(imageUrl: url);
          },
          redirect: (context, state) {
            if (!authProvider.isAuthenticated) {
              return '/';
            }
            return null;
          },
        )
      ],
      redirect: (context, state) {
        if (!authProvider.isAuthenticated && state.location != '/') {
          return '/';
        }
        return null;
      },
    );

    return MaterialApp.router(
      title: 'App Polirubro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, brightness: Brightness.light),
      darkTheme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
      themeMode: darkThemeProvider.darkTheme ? ThemeMode.dark : ThemeMode.light,
      routerConfig: router,
    );
  }
}
