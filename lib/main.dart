import 'package:flutter/material.dart';
import 'package:registerflutterapp/screens/step1_screen.dart';
import 'package:registerflutterapp/screens/step2_screen.dart';
import 'package:registerflutterapp/screens/step3_screen.dart';
import 'package:registerflutterapp/screens/step4_screen.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  List<CustomStep> steps = [];

  @override
  void initState() {
    prepareState();
    super.initState();
  }

  void _validateInputs({VoidCallback onStepContinue}) {
    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
      onStepContinue();
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }

  void prepareState() {
    for (var i = 0; i < 4; i++) {
      print('Active Stepper: ${stepCounter == i}');
      var stepVal = CustomStep(
        title: SizedBox(),
        content: SizedBox(),
      );
      steps.add(stepVal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: stepCounter != 0
          ? AllColors().stepperBackgroundColor
          : AllColors().backgroundColor,
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
                      onPressed: () {
                        setState(() {
                          stepCounter > 0 ? stepCounter -= 1 : stepCounter = 0;
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
                verticalPadding: stepCounter != 0 ? 0.0 : 60.0,
                steps: steps,
                controlsBuilder: (BuildContext context,
                    {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                  if (stepCounter == 0) {
                    return Form(
                      key: _formKey,
                      autovalidate: _autoValidate,
                      child: Screen1(
                        onPressed: ()=> _validateInputs(onStepContinue: onStepContinue),
                      ),
                    );
                  } else if (stepCounter == 1) {
                    return Form(
                      key: _formKey,
                      autovalidate: _autoValidate,
                      child: Screen2(
                        onPressed: ()=> _validateInputs(onStepContinue: onStepContinue),
                      ),
                    );
                  } else if (stepCounter == 2) {
                    return Screen3(
                      onPressed: onStepContinue,
                    );
                  } else if (stepCounter == 3) {
                    return Screen4(
                      onPressed: onStepContinue,
                    );
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
