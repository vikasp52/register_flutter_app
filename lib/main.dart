import 'package:flutter/material.dart';
import 'package:registerflutterapp/widget/custom_stepper.dart';

void main() => runApp(MyApp());

//e8eced

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int stepCounter = 0;

  List<CustomStep> steps = [];

  @override
  void initState() {
    prepareState();
    super.initState();
  }

  void prepareState() {
    for (var i = 0; i < 4; i++) {
      var stepVal = CustomStep(
        title: SizedBox(),
        content: Text("This is the child of $i step"),
        isActive: true,
      );
      steps.add(stepVal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomStepper(
          type: CustomStepperType.horizontal,
          currentStep: this.stepCounter,
          steps: steps,
          onStepTapped: (step) {
            setState(() {
              stepCounter = step;
            });
          },
          onStepCancel: () {
            setState(() {
              stepCounter > 0 ? stepCounter -= 1 : stepCounter = 0;
            });
          },
          onStepContinue: () {
            setState(() {
              stepCounter < steps.length - 1
                  ? stepCounter += 1
                  : stepCounter = 0;
            });
          },
        ),
      ),
    );
  }
}
