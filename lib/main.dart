import 'package:crud_app/providers/product_provider.dart';
import 'package:crud_app/routes/routes.dart';
import 'package:crud_app/views/clients_list.dart';
import 'package:crud_app/views/formulaire.dart';
import 'package:crud_app/views/home_screen.dart';
import 'package:crud_app/views/product_form.dart';
import 'package:crud_app/views/product_list.dart';
import 'package:flutter/material.dart';
import 'package:crud_app/providers/client_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
            providers: [
        ChangeNotifierProvider(create: (ctx) => ClientProvider()),
        ChangeNotifierProvider(create: (ctx) => ProductProvider()), // Adicione o provider de produtos
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: Colors.grey),
            useMaterial3: true,
          ),
          routes: {
          Routes.INICIAL: (_) => const HomeScreen(),
          Routes.FORMULARIO_CLIENTE: (_) => const Formulaire(cliente: null),
          Routes.FORMULARIO_PRODUTO: (_) => const ProductForm(product: null),
          Routes.CLIENTES: (_) => const ClientsList(), // Adicione esta linha para a rota /clientes
          Routes.PRODUTOS: (_) => ProductList(), // Adicione esta linha para a rota /produtos // Adicione a rota para o formulário de produtos
        },),
    );
  }
}
