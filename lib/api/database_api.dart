import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pocket_wallets/transaction_class.dart';

class DatabaseApi {
  final String baseUrl;

  DatabaseApi(this.baseUrl);

  Future<void> addTransaction(Transaction transaction) async {
    final url = Uri.parse('$baseUrl/apinew.php'); // Updated endpoint
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'amount': transaction.amount,
        'name': transaction.name,
        'subtitle': transaction.subtitle,
        'date': transaction.date.toIso8601String(),
        'icon': _iconToString(transaction.icon) // Convert IconData to string
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add transaction');
    }
  }

  Future<List<Transaction>> getTransactions() async {
    final url = Uri.parse('$baseUrl/api.php');
    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception('Failed to load transactions: ${response.statusCode}');
      }

      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) {
        return Transaction(
          item['id'] != null
              ? int.parse(item['id'].toString())
              : 0, // Ensure id is parsed as int
          double.parse(
              item['amount'].toString()), // Ensure amount is parsed as double
          item['name'],
          item['subtitle'],
          DateTime.parse(item['date']),
          _iconFromString(item['icon']), // Convert icon name to IconData
        );
      }).toList();
    } catch (e) {
      print('Error loading transactions: $e');
      throw Exception('Failed to load transactions $e');
    }
  }

  Future<void> deleteTransaction(int id) async {
    final url = Uri.parse('$baseUrl/apidelet.php'); // Updated endpoint
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'id': id}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete transaction');
    }
  }

  String _iconToString(IconData icon) {
    return icon.codePoint.toString();
  }

  IconData _iconFromString(String iconString) {
    return IconData(int.parse(iconString), fontFamily: 'MaterialIcons');
  }
}
