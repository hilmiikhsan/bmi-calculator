import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BmiCalculator(),
    );
  }
}

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int currentIndex = 0;
  String result = "";
  double height = 0.0;
  double weight = 0.0;

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator Apps",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: const Color(0xfffafafa),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  radioButton("Laki-laki", Colors.blue, 0),
                  radioButton("Perempuan", Colors.pink, 1),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "Tinggi Badan Kamu :",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: heightController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Masukan tinngi badan kamu",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(
                height: 20.0,
              ),

              const Text(
                "Berat Badan Kamu :",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: weightController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Masukan berat badan kamu",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              // ignore: sized_box_for_whitespace
              Container(
                width: double.infinity,
                height: 50.0,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      height = double.parse(heightController.text);
                      weight = double.parse(weightController.text);
                    });
                    calculateBmi(height, weight);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    "Calculate",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const SizedBox(
                width: double.infinity,
                // ignore: unnecessary_const
                child: const Text(
                  "BMI kamu :",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  result,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculateBmi(double height, double weight) {
    double finalResult = weight / (height * height / 10000);
    String bmi = finalResult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12.0),
        height: 80.0,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: currentIndex == index ? color : Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: () {
            changeIndex(index);
          },
          child: Text(
            value,
            style: TextStyle(
              color: currentIndex == index ? Colors.white : color,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
