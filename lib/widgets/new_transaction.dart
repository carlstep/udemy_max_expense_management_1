import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTx(
      enteredTitle,
      enteredAmount,
    );
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
              decoration: InputDecoration(labelText: 'title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              //onChanged: (value) => titleInput = value;
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
              decoration: const InputDecoration(labelText: 'amount'),
              //onChanged: (value) => amountInput = value,
            ),
            TextButton(
              onPressed: () {
                submitData;
                print(titleController.text);
                print(amountController.text);
              },
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.purple)),
              child: Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
