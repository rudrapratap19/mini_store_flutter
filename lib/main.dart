import 'package:flutter/material.dart';
import 'package:mini_store/services/wishlist_services.dart';
import 'package:provider/provider.dart';

import 'providers/cart_provider.dart';
import 'screens/login_screen.dart';
import 'screens/product_list_screen.dart';
import 'screens/cart_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WishlistService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CartProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mini Store',
        theme: ThemeData(primarySwatch: Colors.indigo),
        initialRoute: LoginScreen.routeName,
        routes: {
          LoginScreen.routeName: (_) => const LoginScreen(),
          ProductListScreen.routeName: (_) => const ProductListScreen(),
          CartScreen.routeName: (_) => const CartScreen(),
        },
      ),
    );
  }
}
