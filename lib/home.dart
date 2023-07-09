import 'package:bmi_app/result.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;

  double height = 179;
  int weight = 75;
  int age = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Body Mass Index"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    buildExpanded(context, "male"),
                    const SizedBox(
                      width: 15,
                    ),
                    buildExpanded(context, "female"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Height",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    const  SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toStringAsFixed(2),
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const Text(
                            " CM",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const  SizedBox(height: 20,),
                      Slider(
                        value: height,
                        onChanged: (newValue) {
                          setState(() {
                            height=newValue;
                          });
                        },
                        min: 20,
                        max: 220,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    buildExpanded2(context, "weight"),
                    const SizedBox(
                      width: 15,
                    ),
                    buildExpanded2(context, "age"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.teal,
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 16,
                child: TextButton(
                  onPressed: () {
                    var result = weight / pow(height / 100, 2);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Result(result: result, isMale: isMale, age: age);
                      }),
                    );
                  },
                  child: Text(
                    "Calculate",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildExpanded(BuildContext context, String gender) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = gender == 'male' ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color:
                (isMale && gender == 'male') || (!isMale && gender == 'female')
                    ? Colors.teal
                    : Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                gender == 'male' ? Icons.male : Icons.female,
                size: 90,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                gender == 'male' ? "Male" : "Female",
                style: Theme.of(context).textTheme.headlineMedium,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildExpanded2(BuildContext context, String value) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value == 'age' ? "Age" : "Weight",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              value == 'age' ? "$age" : "$weight",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: value == 'age' ? "Age -" : "Weight -",
                  onPressed: () {
                    setState(() {
                      value == 'age' ? age-- : weight--;
                    });
                  },
                  mini: true,
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  heroTag: value == 'age' ? "Age +" : "Weight +",
                  onPressed: () {
                    setState(() {
                      value == 'age' ? age++ : weight++;
                    });
                  },
                  mini: true,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
