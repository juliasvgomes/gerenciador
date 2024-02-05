// product.dart
// models/product.dart
class Product {
  final String id;
  final String nome;
  final String descricao;
  final double preco;
  final String data_atualizado;

  const Product({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.data_atualizado,
  });

  // Método copyWith para criar uma cópia imutável com campos opcionais
  Product copyWith({
    String? id,
    String? nome,
    String? descricao,
    double? preco,
    String? data_atualizado,
  }) {
    return Product(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      descricao: descricao ?? this.descricao,
      preco: preco ?? this.preco,
      data_atualizado: data_atualizado ?? this.data_atualizado,
    );
  }
}
