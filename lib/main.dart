import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Expense Management App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'breakfast',
      amount: 9.50,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'bus trip',
      amount: 17.50,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'NZ Flight',
      amount: 1283.50,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Xpnc'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.lightBlue[200],
                elevation: 5,
                child: Text('CHART'),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        padding: EdgeInsets.all(10),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 3,
                          ),
                        ),
                        child: Text(
                          '\$ ${tx.amount}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purple),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.purple),
                          ),
                          Text(
                            DateFormat.yMMMEd().format(tx.date),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ));
  }
}
