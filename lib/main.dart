import 'package:flutter/material.dart';
import 'package:registerflutterapp/screens/step1_screen.dart';
import 'package:registerflutterapp/utils/colors.dart';
import 'package:registerflutterapp/widget/custom_background.dart';
import 'package:registerflutterapp/widget/custom_stepper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
    return Scaffold(
      backgroundColor: AllColors().backgroundColor,
      appBar: stepCounter != 0
          ? AppBar(
        backgroundColor: AllColors().stepperBackgroundColor,
              elevation: 0.0,
              title: Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: AllColors().whiteColor,
                      ),
                      onPressed: (){
                        setState(() {
                          stepCounter < steps.length - 1
                              ? stepCounter += 1
                              : stepCounter = 0;
                        });
                      }),
                  Text(
                    'Create Account',
                    style: TextStyle(
                      color: AllColors().whiteColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            )
          : null,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: Theme(
              data: ThemeData(
                canvasColor: AllColors().stepperBackgroundColor,
              ),
              child: CustomStepper(
                type: CustomStepperType.horizontal,
                currentStep: this.stepCounter,
                steps: steps,
                controlsBuilder: (BuildContext context,
                    {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                  if (stepCounter == 0) {
                    return Screen1(
                      onPressed: onStepContinue,
                    );
                  } else if (stepCounter == 1) {
                    return MaterialButton(
                        color: Colors.grey,
                        onPressed: onStepContinue,
                        child: Text('Vikas2'));
                  } else if (stepCounter == 2) {
                    return MaterialButton(
                        color: Colors.blueAccent,
                        onPressed: onStepContinue,
                        child: Text('Vikas3'));
                  } else if (stepCounter == 3) {
                    return MaterialButton(
                        color: Colors.cyan,
                        onPressed: onStepContinue,
                        child: Text('Vikas4'));
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
          ),
        ],
      ),
    );
  }
}
