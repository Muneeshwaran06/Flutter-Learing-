import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());

}
class MyApp extends StatefulWidget{
  @override
  _State createState() => _State() ;

  }

class _State extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
        body:  Container(
          height: 300,
          width: double.infinity,
          color: Colors.blue,
        child: Image.network("https://via.placeholder.com/150"),


          //padding: EdgeInsets.all(20),
          //margin: EdgeInsets.all(20),
          //height: 250,
         // width: double.infinity,
          // alignment: Alignment.center,
          // decoration: BoxDecoration(
          //   image:DecorationImage(image: AssetImage("assets/ifell.jpeg"),
          //     fit: BoxFit.cover,)
            //,
            // gradient: LinearGradient(colors: [Colors.blueAccent,Colors.purpleAccent],
            // begin: Alignment.centerLeft,
            // end: Alignment.centerRight),
            // gradient: RadialGradient(colors: [
            //   Colors.yellow,Colors.red],
            // center: Alignment.center,
            // radius: 0.8),
            // gradient: SweepGradient(colors: [
            //   Colors.blueAccent,Colors.greenAccent,Colors.redAccent,Colors.blueAccent],
            // center: Alignment.center,
            // startAngle: 0.0,
            // endAngle: 3.14),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.orangeAccent.withOpacity(1),
            //     spreadRadius: 5,
            //     blurRadius: 20,
            //     offset: Offset(0, 10),
            //   ),
            // ],
            //color: Colors.orangeAccent,
            //borderRadius: BorderRadius.circular(14),
          ),
          // child:(Text("hi hello",style:TextStyle(color: Colors.white,height: 2))
          // ),
        ),

    
    );

  }
}


