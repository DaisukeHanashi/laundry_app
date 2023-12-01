import 'package:flutter/material.dart';

class Ewallet extends StatelessWidget {
  const Ewallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> shopNames = ['Rinse', 'Berry Clean', 'Tumbledry','Quick Stop Laundry']; 

    return Scaffold(
      appBar: AppBar(
        title: const Text('E-wallet'),
        backgroundColor: const Color(0xFF0E5C46),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Balance',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0E5C46),
              ),
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Text(
                  '₱1,000.00',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0E5C46),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement Cash In action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0E5C46),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Cash In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement Send Money action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0E5C46),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Send',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Transaction History',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0E5C46),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: const Icon(Icons.payment, color: Color(0xFF0E5C46)),
                    title: Text(
                      shopNames[index % shopNames.length], 
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text(
                      'Amount: ₱50.00',
                      style: TextStyle(fontSize: 14),
                    ),
                    onTap: () {
                      
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
