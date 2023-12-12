import 'package:flutter/material.dart';

class CustomerSupportPage extends StatefulWidget {
  const CustomerSupportPage({Key? key}) : super(key: key);

  @override
  State<CustomerSupportPage> createState() => _CustomerSupportPageState();
}

class _CustomerSupportPageState extends State<CustomerSupportPage> {
  String selectedIssue = 'Missing Clothes'; 
  TextEditingController otherIssueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Support'),
        backgroundColor: const Color(0xFF0E5C46),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Center(
            child: Text(
              'Report an Issue',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Select the type of issue:',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          DropdownButton<String>(
            isExpanded: true,
            hint: const Text('Select an issue'),
            value: selectedIssue,
            onChanged: (value) {
              setState(() {
                selectedIssue = value!;
              });
            },
            items: [
              'Missing Clothes',
              'Damaged Clothes',
              'Late Delivery',
              'Other Concerns',
            ].map((String issue) {
              return DropdownMenuItem<String>(
                value: issue,
                child: Text(issue),
              );
            }).toList(),
          ),
          if (selectedIssue == 'Other Concerns')
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Specify the issue:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: otherIssueController,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    hintText: 'Enter your specific issue here...',
                  ),
                ),
              ],
            ),
          const SizedBox(height: 35),
          const Text(
            'Describe the issue:',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          const TextField(
            maxLines: 4,
            maxLength: 200,
            decoration: InputDecoration(
              hintText: 'Enter your description here...',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Success'),
                  content: const Text('Your concern has been successfully submitted.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        // Close the dialog
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0E5C46),
            minimumSize: const Size(double.infinity, 40),
          ),
          child: const Text('Submit'),
        ),
        ],
      ),
    );
  }
}
