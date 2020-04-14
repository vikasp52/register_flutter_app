import 'package:flutter/material.dart';
import 'package:registerflutterapp/widget/custom_background.dart';
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
        content: SizedBox(),
        isActive: true,
      );
      steps.add(stepVal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: CustomStepper(
                type: CustomStepperType.horizontal,
                currentStep: this.stepCounter,
                steps: steps,
                controlsBuilder: (BuildContext context,
                    {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                  if (stepCounter == 1) {
                    return MaterialButton(
                        onPressed: onStepContinue, child: Text('Vikas1'));
                  } else if (stepCounter == 2) {
                    return Text('Vikas2');
                  } else if (stepCounter == 3) {
                    return Text('Vikas3');
                  }
                  return Text('Vikas ');
                },
                onStepTapped: (step) {
                  setState(() {
                    stepCounter = step;
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
          ],
        ),
      ),
    );
  }
}
