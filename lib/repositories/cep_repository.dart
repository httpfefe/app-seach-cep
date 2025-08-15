import 'package:flutter_application/model/cep_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CepRepository {
  static const String _baseUrl = 'https://viacep.com.br/ws/';
  final http.Client client;

  CepRepository({required this.client});

  Future<CepModel> consultarCep(String cep) async {
    final cleanCep = cep.replaceAll(RegExp(r'[^0-9]'), '');
    if (cleanCep.length != 8) {
      throw Exception('O CEP deve conter 8 digitos.');
    }

    final url = Uri.parse('$_baseUrl$cleanCep/json');
    try {
      final response = await client.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        if (jsonData.containsKey('erro')) {
          throw Exception('CEP não encontrado.');
        }
        return CepModel.fromJson(jsonData);
      } else {
        throw Exception('Erro na requisiçao: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro ao realizar a requisição: $e');
    }
  }
}
