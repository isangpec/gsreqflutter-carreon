import 'package:flutter/material.dart';

void main() => runApp(DogAgeCalculatorApp());

class DogAgeCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dog Age Calculator'),
        ),
        body: DogAgeCalculator(),
      ),
    );
  }
}

class DogAgeCalculator extends StatefulWidget {
  @override
  _DogAgeCalculatorState createState() => _DogAgeCalculatorState();
}

class _DogAgeCalculatorState extends State<DogAgeCalculator> {
  int humanYears = 0;
  TextEditingController dogYearsController = TextEditingController();

  void calculateAge() {
    int dogYears = int.tryParse(dogYearsController.text) ?? 0;
    setState(() {
      humanYears = calculateHumanAge(dogYears);
    });
  }

  int calculateHumanAge(int dogYears) {
    return dogYears * 7; // Simplified example
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: dogYearsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Dog\'s Age in Years',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: calculateAge,
            child: Text('Calculate Age'),
          ),
          SizedBox(height: 16),
          Text(
            'Dog\'s Age in Human Years:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            '$humanYears years',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
