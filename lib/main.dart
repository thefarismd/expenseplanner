import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'EmployeeID',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 16.54,
        date: DateTime.now()),
  ];

  // String titleInput;
  // String amountInput;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('CHART!'),
                elevation: 5,
              ),
            ),
            Card(
              color: Colors.red,
              child: Text('LIST OF TX'),
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      controller: titleController,
                      // onChanged: ((value) {
                      //   titleInput = value;
                      // }),
                      decoration: InputDecoration(labelText: 'Title'),
                    ),
                    TextField(
                      controller: amountController,
                      // onChanged: ((value) {
                      //   amountInput = value;
                      // }),
                      decoration: InputDecoration(labelText: 'Amount'),
                    ),
                    TextButton(
                        onPressed: () {
                          print(titleController.text);
                          print(amountController.text);
                        },
                        child: Text('Add Transaction',
                            style: TextStyle(color: Colors.purple)))
                  ],
                ),
              ),
            ),
            Column(
              children: transactions
                  .map((transaction) => Card(
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              //border - use decoration
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.purple,
                                width: 2,
                              )),
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              child: Text('\$${transaction.amount}',
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  transaction.title,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  DateFormat.yMMMd().format(transaction.date),
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            )
                          ],
                        ),
                      ))
                  .toList(),
            )
          ],
        ));
  }
}
