import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  // const MyWidget({Key key}) : super(key: key);

  final Function addTxHandler;

  NewTransaction(this.addTxHandler);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTxHandler(enteredTitle, enteredAmount);

    Navigator.of(context).pop(); //to remove keyboard after entering data.
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
