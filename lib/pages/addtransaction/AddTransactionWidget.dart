import 'package:flutter/material.dart';
import 'package:pocket_wallets/transaction_class.dart'; // Adjust the import path as necessary
import 'package:pocket_wallets/api/database_api.dart'; // Adjust the import path as necessary

class AddTransactionWidget extends StatefulWidget {
  AddTransactionWidget({super.key});

  @override
  State<AddTransactionWidget> createState() => _AddTransactionWidgetState();
}

class _AddTransactionWidgetState extends State<AddTransactionWidget> {
  final DatabaseApi _databaseApi =
      DatabaseApi('http://pocketwallet.atwebpages.com/apinew.php');
  IconData? selectedIcon;
  final TextEditingController _controllerAmount = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerSubtitle = TextEditingController();
  DateTime selectedDateTime = DateTime.now(); // Set initial date to now
  List<bool> isSelected = [true, false];

  final List<IconData> icons = [
    Icons.account_balance_wallet,
    Icons.home,
    Icons.shopping_bag,
    Icons.coffee,
    Icons.local_grocery_store,
    Icons.tips_and_updates,
    Icons.directions_car,
    Icons.people,
    Icons.trending_up,
    Icons.trending_down,
    Icons.account_balance,
    Icons.construction,
    Icons.store,
    Icons.pets,
    Icons.restaurant,
    Icons.volunteer_activism,
    Icons.flight_takeoff,
    Icons.devices,
    Icons.fitness_center,
    Icons.movie,
    Icons.cake,
    Icons.chair,
    Icons.fastfood,
    Icons.hotel,
    Icons.cleaning_services,
    Icons.local_hospital,
    Icons.two_wheeler,
    Icons.sports_esports,
    Icons.sports_tennis,
    Icons.icecream,
    Icons.business_center,
  ];

  @override
  void initState() {
    super.initState();
  }

  void handleSubmit() async {
    try {
      double amount = double.parse(_controllerAmount.text);
      if (isSelected[1]) {
        amount = -amount; // Make amount negative if "minus" is selected
      }
      String name = _controllerName.text;
      String subtitle = _controllerSubtitle.text;
      DateTime date = selectedDateTime;

      Transaction newTransaction = Transaction(
        0, // id will be auto-generated by the database
        amount,
        name,
        subtitle,
        date,
        selectedIcon ?? Icons.account_balance_wallet,
      );

      await _databaseApi.addTransaction(newTransaction);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Transaction added successfully."),
        ),
      );

      Navigator.pop(
          context, true); // Close the AddTransactionWidget and return true
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter valid input for all fields. $e"),
        ),
      );
    }
  }

  Future<void> _selectDateAndTime() async {
    DateTime initialDate = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      TimeOfDay pickedTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(initialDate),
          ) ??
          TimeOfDay.now();

      final DateTime combinedDateTime = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );

      setState(() {
        selectedDateTime = combinedDateTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Transaction",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Text(
                      "Transaction Name:",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: 35,
                    child: TextField(
                      controller: _controllerName,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Text(
                      "Select Amount:",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                ToggleButtons(
                  isSelected: isSelected,
                  onPressed: (int index) {
                    setState(() {
                      for (int buttonIndex = 0;
                          buttonIndex < isSelected.length;
                          buttonIndex++) {
                        isSelected[buttonIndex] = buttonIndex == index;
                      }
                    });
                  },
                  constraints: const BoxConstraints(
                    minWidth: 1,
                    minHeight: 1,
                  ),
                  children: <Widget>[
                    Icon(
                      Icons.add,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    Icon(Icons.remove,
                        color: Theme.of(context).colorScheme.tertiary),
                  ],
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 35,
                    child: TextField(
                      controller: _controllerAmount,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        suffixText: '\$',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: DropdownButton<IconData>(
                    value: selectedIcon,
                    onChanged: (IconData? newValue) {
                      setState(() {
                        selectedIcon = newValue;
                      });
                    },
                    items: icons.map((IconData icon) {
                      return DropdownMenuItem<IconData>(
                        value: icon,
                        child: Row(
                          children: [
                            Icon(icon),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Text(
                      "Note:",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: 35,
                    child: TextField(
                      controller: _controllerSubtitle,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Text(
                      "Date and Time:",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                    onPressed: _selectDateAndTime,
                    child: Text(
                      "${selectedDateTime.toLocal()}".split(' ')[0] +
                          ' ' +
                          "${selectedDateTime.toLocal()}"
                              .split(' ')[1]
                              .substring(0, 5),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: handleSubmit,
        child: Icon(
          Icons.check,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
