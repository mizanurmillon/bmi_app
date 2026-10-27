import 'package:bmi_app/main.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text('Intro')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the app!', style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold)
            ),

            SizedBox(height: 15,),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => MyHomePage(title: 'BMI Calculator'),
              ));
            }, child: Text('Get Started'))
          ],
        ),
      )
    );

  }

}