// home_screen.dart
import 'package:crud_app/routes/routes.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciamento'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.CLIENTES);
              },
              child: const Text('Clientes'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.PRODUTOS);
              },
              child: const Text('Produtos'),
            ),
          ],
        ),
      ),
    );
  }
}
