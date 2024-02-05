// product_provider.dart
import 'dart:math';

import 'package:crud_app/models/product.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  final Map<String, Product> _items = {...STANDARD_PRODUCTS};

  List<Product> get allProducts {
    return [..._items.values];
  }

  int get productCount {
    return _items.length;
  }

  Product getProductByIndex(int index) {
    return _items.values.elementAt(index);
  }

  void addProduct(Product product) {
    final id = Random().nextDouble().toString(); // Gera um ID único
    final newProduct = Product(
      id: id,
      nome: product.nome,
      descricao: product.descricao,
      preco: product.preco,
      data_atualizado: product.data_atualizado,
    );

    _items.putIfAbsent(id, () => newProduct);
    notifyListeners();
  }

  void removeProduct(String id) {
    _items.remove(id);
    notifyListeners();
  }
}

// ignore: constant_identifier_names
const STANDARD_PRODUCTS = {
  '1': Product(
    id: '1',
    nome: 'Produto 1',
    descricao: 'Descrição do Produto 1',
    preco: 19.99,
    data_atualizado: '11/04/2022',
  ),
  '2': Product(
    id: '2',
    nome: 'Produto 2',
    descricao: 'Descrição do Produto 2',
    preco: 29.99,
    data_atualizado: '11/04/2022',
  ),
  '3': Product(
    id: '3',
    nome: 'Produto 3',
    descricao: 'Descrição do Produto 3',
    preco: 39.99,
    data_atualizado: '11/04/2022',
  ),
};
