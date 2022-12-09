import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // const MyWidget({Key key}) : super(key: key);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
