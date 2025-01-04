import 'package:flutter/material.dart';
import 'package:pocket_wallets/transaction_class.dart';
import 'package:pocket_wallets/api/database_api.dart';

class Homepagewidget extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const Homepagewidget({super.key, required this.onToggleTheme});

  @override
  State<Homepagewidget> createState() => _HomepagewidgetState();
}

class _HomepagewidgetState extends State<Homepagewidget> {
  late Future<List<Transaction>> _transactionsFuture;
  final DatabaseApi _databaseApi =
      DatabaseApi('http://pocketwallet.atwebpages.com/');
  String _sortOption = 'Date'; // Set default to 'Date'
  bool _groupByMonth = true; // Set default to true

  @override
  void initState() {
    super.initState();
    _transactionsFuture = _databaseApi.getTransactions();
  }

  void _sortTransactions(List<Transaction> transactions) {
    switch (_sortOption) {
      case 'ID':
        transactions.sort((a, b) => b.id.compareTo(a.id));
        break;
      case 'ID ascending':
        transactions.sort((a, b) => a.id.compareTo(b.id));
        break;
      case 'Amount':
        transactions.sort((a, b) => b.amount.compareTo(a.amount));
        break;
      case 'Amount ascending':
        transactions.sort((a, b) => a.amount.compareTo(b.amount));
        break;
      case 'Date':
        transactions.sort((a, b) => b.date.compareTo(a.date));
        break;
      case 'Date ascending':
        transactions.sort((a, b) => a.date.compareTo(b.date));
        break;
    }
  }

  Map<String, List<Transaction>> _groupTransactionsByMonth(
      List<Transaction> transactions) {
    Map<String, List<Transaction>> groupedTransactions = {};
    for (var transaction in transactions) {
      String monthYear = "${transaction.date.month}-${transaction.date.year}";
      if (groupedTransactions.containsKey(monthYear)) {
        groupedTransactions[monthYear]!.add(transaction);
      } else {
        groupedTransactions[monthYear] = [transaction];
      }
    }
    return groupedTransactions;
  }

  double _calculateSum(List<Transaction> transactions, bool positive) {
    return transactions
        .where((transaction) =>
            positive ? transaction.amount > 0 : transaction.amount < 0)
        .fold(0.0, (sum, transaction) => sum + transaction.amount);
  }

  double _calculateTotalSum(List<Transaction> transactions) {
    return transactions.fold(
        0.0, (sum, transaction) => sum + transaction.amount);
  }

  void _promptDeleteTransaction(int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Transaction'),
          content:
              const Text('Are you sure you want to delete this transaction?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await _databaseApi.deleteTransaction(id);
                setState(() {
                  _transactionsFuture =
                      _databaseApi.getTransactions(); // Refresh transactions
                });
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                'Delete',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Pocket Wallets",
          style: Theme.of(context).textTheme.displaySmall,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: widget.onToggleTheme,
          ),
          PopupMenuButton<String>(
            icon:
                Icon(Icons.more_vert, color: Theme.of(context).iconTheme.color),
            onSelected: (String result) {
              if (result == 'refresh') {
                setState(() {
                  _transactionsFuture = _databaseApi.getTransactions();
                });
              } else if (result == 'groupByMonth') {
                setState(() {
                  _groupByMonth = true;
                });
              } else if (result == 'originalView') {
                setState(() {
                  _groupByMonth = false;
                });
              } else {
                setState(() {
                  _sortOption = result;
                });
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'refresh',
                child: Text('Refresh'),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem<String>(
                enabled: false,
                child: Text('Sort by'),
              ),
              const PopupMenuItem<String>(
                value: 'ID',
                child: Text('ID'),
              ),
              const PopupMenuItem<String>(
                value: 'ID ascending',
                child: Text('ID ascending'),
              ),
              const PopupMenuItem<String>(
                value: 'Amount',
                child: Text('Amount'),
              ),
              const PopupMenuItem<String>(
                value: 'Amount ascending',
                child: Text('Amount ascending'),
              ),
              const PopupMenuItem<String>(
                value: 'Date',
                child: Text('Date'),
              ),
              const PopupMenuItem<String>(
                value: 'Date ascending',
                child: Text('Date ascending'),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem<String>(
                value: 'groupByMonth',
                child: Text('Group by Month'),
              ),
              const PopupMenuItem<String>(
                value: 'originalView',
                child: Text('Original View'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          FutureBuilder<List<Transaction>>(
            future: _transactionsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No transactions found.'));
              } else {
                final transactions = snapshot.data!;
                final totalSum = _calculateTotalSum(transactions);
                return Container(
                  height: 50,
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.primary,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Wallet 1",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          'Total: \$${totalSum.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
          Expanded(
            child: FutureBuilder<List<Transaction>>(
              future: _transactionsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No transactions found.'));
                } else {
                  final transactions = snapshot.data!;
                  _sortTransactions(transactions); // Sort transactions
                  if (_groupByMonth) {
                    final groupedTransactions =
                        _groupTransactionsByMonth(transactions);
                    return ListView(
                      children: groupedTransactions.entries.map((entry) {
                        final positiveSum = _calculateSum(entry.value, true);
                        final negativeSum = _calculateSum(entry.value, false);
                        final totalSum = positiveSum + negativeSum;
                        final totalColor = totalSum >= 0
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.tertiary;
                        return ExpansionTile(
                          initiallyExpanded: true, // Expand by default
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(entry.key),
                              Text(
                                '\$${negativeSum.toStringAsFixed(2)} + \$${positiveSum.toStringAsFixed(2)} = \$${totalSum.toStringAsFixed(2)}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: totalColor),
                              ),
                            ],
                          ),
                          children: entry.value.map((transaction) {
                            return GestureDetector(
                              onLongPress: () =>
                                  _promptDeleteTransaction(transaction.id),
                              child: TransactionTile(
                                context: context,
                                id: transaction.id,
                                name: transaction.name,
                                subtitle: transaction.subtitle,
                                amount: transaction.amount,
                                icon: transaction.icon,
                                date: transaction.date,
                              ),
                            );
                          }).toList(),
                        );
                      }).toList(),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        final transaction = transactions[index];
                        return GestureDetector(
                          onLongPress: () =>
                              _promptDeleteTransaction(transaction.id),
                          child: TransactionTile(
                            context: context,
                            id: transaction.id,
                            name: transaction.name,
                            subtitle: transaction.subtitle,
                            amount: transaction.amount,
                            icon: transaction.icon,
                            date: transaction.date,
                          ),
                        );
                      },
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () async {
          final result =
              await Navigator.of(context).pushNamed('AddTransaction');
          if (result == true) {
            setState(() {
              _transactionsFuture =
                  _databaseApi.getTransactions(); // Refresh transactions
            });
          }
        },
        child: Icon(Icons.add, color: Theme.of(context).iconTheme.color),
      ),
    );
  }
}

class TransactionTile extends StatelessWidget {
  final BuildContext context;
  final int id; // Add this line
  final String name;
  final String subtitle;
  final double amount;
  final IconData icon;
  final DateTime? date;

  const TransactionTile({
    super.key,
    required this.context,
    required this.id, // Add this line
    required this.name,
    required this.subtitle,
    required this.amount,
    required this.icon,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    Color amountColor = amount > 0
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.tertiary;

    String formattedDate;
    if (date == null || date?.year == 0) {
      formattedDate = '00/00/0000';
    } else {
      formattedDate = '${date?.month.toString().padLeft(2, '0')}/'
          '${date?.day.toString().padLeft(2, '0')}/'
          '${date?.year}';
    }

    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).iconTheme.color,
      ),
      title: Text(
        name,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        '$formattedDate | $subtitle',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      trailing: Text(
        '\$${amount.toStringAsFixed(2)}',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: amountColor,
            ),
      ),
    );
  }
}
