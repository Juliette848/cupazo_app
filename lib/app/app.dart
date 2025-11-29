import 'package:flutter/material.dart';
import '../core/ui/theme/theme.dart';
import '../shared/constants/routes.dart';
import '../features/auth/presentation/pages/pages.dart';
import '../features/auth/presentation/register_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/home/presentation/pages/category_products_screen.dart';
import '../features/home/presentation/pages/product_detail_screen.dart';
import '../features/home/domain/models/product.dart';

/// Bootstrap de la aplicación
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cupazo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routes: {
        AppRoutes.splash: (_) => const LoginPage(),
        AppRoutes.login: (_) => const LoginPage(),
        AppRoutes.signUp: (_) => const SignUpPage(),
        AppRoutes.register: (_) => const RegisterScreen(),
        AppRoutes.home: (_) => const HomeScreen(),
        AppRoutes.categoryProducts: (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>?;
          return CategoryProductsScreen(
            categoryName: args?['categoryName'] ?? 'Categoría',
          );
        },
        AppRoutes.productDetail: (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>?;
          return ProductDetailScreen(product: args?['product'] as Product);
        },
      },
      initialRoute: AppRoutes.login,
    );
  }
}
