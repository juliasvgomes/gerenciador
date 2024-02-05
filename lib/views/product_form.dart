// product_form.dart
import 'package:crud_app/models/product.dart';
import 'package:crud_app/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProductForm extends StatefulWidget {
  final Product? product;

  const ProductForm({Key? key, required this.product}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  late Product _editedProduct;

  @override
  void initState() {
    super.initState();
    // ignore: prefer_const_constructors
    _editedProduct = widget.product ?? Product(id: '', nome: '', descricao: '', preco: 0.0, data_atualizado: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product == null ? 'Adicionar Produto' : 'Editar Produto'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Provider.of<ProductProvider>(context, listen: false).addProduct(_editedProduct);
                Navigator.of(context).pop();
              }
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _editedProduct.nome,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome Inválido';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = _editedProduct.copyWith(nome: value!);
                },
              ),
              TextFormField(
                initialValue: _editedProduct.descricao,
                decoration: const InputDecoration(labelText: 'Descrição'),
                onSaved: (value) {
                  _editedProduct = _editedProduct.copyWith(descricao: value!);
                },
              ),
              TextFormField(
                initialValue: _editedProduct.preco.toString(),
                decoration: const InputDecoration(labelText: 'Preço'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || double.tryParse(value) == null || double.parse(value) <= 0) {
                    return 'Preço Inválido';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = _editedProduct.copyWith(preco: double.parse(value!));
                },
              ),
              TextFormField(
                initialValue: _editedProduct.data_atualizado,
                decoration: const InputDecoration(labelText: 'Data'),
                onSaved: (value) {
                  _editedProduct = _editedProduct.copyWith(data_atualizado: value!);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
