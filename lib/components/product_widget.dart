// product_widget.dart
import 'package:crud_app/models/product.dart';
import 'package:crud_app/providers/product_provider.dart';
import 'package:crud_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return ListTile(
      title: Text(product.nome),
      subtitle: Text('R\$ ${product.preco.toStringAsFixed(2)}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                Routes.FORMULARIO_PRODUTO,
                arguments: product,
              );
            },
            icon: const Icon(Icons.edit),
            color: Colors.orange,
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text('Excluir Produto'),
                  content: const Text('Tem certeza?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text('Não'),
                    ),
                    TextButton(
                      onPressed: () {
                        productProvider.removeProduct(product.id);
                        Navigator.of(context).pop(true);
                      },
                      child: const Text('Sim'),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.delete),
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
