import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  // final List<Transaction> userTransaction = [
  //   Transaction(
  //     id: 't1',
  //     title: 'EmployeeID',
  //     amount: 69.99,
  //     date: DateTime.now(),
  //   ),
  //   Transaction(
  //       id: 't2',
  //       title: 'Weekly Groceries',
  //       amount: 16.54,
  //       date: DateTime.now()),
  // ];

  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: ListTile(
                    trailing: IconButton(
                      onPressed: (() => deleteTx(transactions[index].id)),
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).errorColor,
                      ),
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date)),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text('\$${transactions[index].amount}')),
                      ),
                    ),
                  ),
                );
                // return Card(
                //   child: Row(
                //     children: [
                //       Container(
                //         padding: EdgeInsets.all(10),
                //         //border - use decoration
                //         decoration: BoxDecoration(
                //             border: Border.all(
                //           color: Theme.of(context).primaryColor,
                //           width: 2,
                //         )),
                //         margin:
                //             EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                //         child: Text(
                //             '\$${transactions[index].amount.toStringAsFixed(2)}',
                //             style: TextStyle(
                //                 color: Theme.of(context).primaryColor,
                //                 fontSize: 20,
                //                 fontWeight: FontWeight.bold)),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             transactions[index].title,
                //             style: Theme.of(context).textTheme.titleMedium,
                //           ),
                //           Text(
                //             DateFormat.yMMMd().format(transactions[index].date),
                //             style: TextStyle(color: Colors.grey),
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
