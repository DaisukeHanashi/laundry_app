import 'package:flutter/material.dart';

class Ewallet extends StatelessWidget {
  const Ewallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> transactions = [
      {'type': 'Order', 'date': '05-04-23', 'shop': 'Rinse', 'amount': -150.00},
      {'type': 'Order', 'date': '10-03-23', 'shop': 'Berry Clean', 'amount': -100.00},
      {'type': 'Order', 'date': '05-02-23', 'shop': 'Tumbledry', 'amount': -120.00},
      {'type': 'Order', 'date': '01-01-23', 'shop': 'Quick Stop Laundry', 'amount': 500.00},
    ];

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 160,
            color: const Color(0xFF0E5C46),
            child: AppBar(
              title: const Text('Load Wash Points'),
              backgroundColor: const Color(0xFF0E5C46),
              automaticallyImplyLeading: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(158, 212, 212, 212),
                        offset: Offset(
                          2.0,
                          2.0,
                        ),
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Available Balance',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            '₱1,000.00',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                const Text(
                  'Transaction History',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      final transaction = transactions[index];
                      return Card(
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          leading: const Icon(Icons.payment, color: Color(0xFF0E5C46)),
                          title: Text(
                            '${transaction['type']} - ${transaction['date']}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            '${transaction['shop']}',
                            style: const TextStyle(fontSize: 14),
                          ),
                          trailing: Text(
                            '₱${transaction['amount'].abs().toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
