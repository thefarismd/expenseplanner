import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // const MyWidget({Key key}) : super(key: key);

  final Function addTxHandler;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTxHandler);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTxHandler(enteredTitle, enteredAmount);
  }

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
              keyboardType: TextInputType.text,
              onSubmitted: (_) => submitData(), //underscore indicate not needed
              // onChanged: ((value) {
              //   titleInput = value;
              // }),
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: amountController,
              onSubmitted: (_) => submitData(), //underscore indicate not needed
              // onChanged: ((value) {
              //   amountInput = value;
              // }),
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            TextButton(
                onPressed: () {
                  submitData;
                },
                child: Text('Add Transaction',
                    style: TextStyle(color: Colors.purple)))
          ],
        ),
      ),
    );
  }
}
