import 'package:bmi_app/IntroPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: IntroPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = '';
  var bgColor = Colors.blue.shade100;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                SizedBox(height: 30),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter Your Weight (in kgs)'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 20),

                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter Your Height (in feet)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 20),

                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text('Enter Your Height (in inches)'),
                    prefixIcon: Icon(Icons.insert_chart),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 20),

                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if(wt != '' && ft != '' && inch != ''){
                    //BMI calculation
                    var iwt = int.parse(wt);
                    var ift = int.parse(ft);
                    var iInch = int.parse(inch);

                    var tInch = (ift * 12) + iInch;
                    var tCm = tInch * 2.54;
                    var tM = tCm / 100;
                    var bmi = iwt / (tM * tM);

                    var message = '';

                    if(bmi > 25){
                      message = 'You are overweight!!';
                      bgColor = Colors.orange.shade100;
                    } else if(bmi < 18){
                      message = 'You are underweight!!';
                      bgColor = Colors.red.shade100;
                    } else{
                      message = 'You are Healthy!!';
                      bgColor = Colors.green.shade100;
                    }

                    setState(() {
                      result = '$message \n Your BMI is : ${bmi.toStringAsFixed(2)}';
                    });

                  } else{
                    setState(() {
                      result = 'Please fill all the required blanks!!';
                    });
                  }
                }, child: Text('Calculate')),

                SizedBox(height: 20),

                Text(result, style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54)
                ),

                SizedBox(height: 20),

              ],
            ),
          ),
        ),
      )

    );
  }
}
