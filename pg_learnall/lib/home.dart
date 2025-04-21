import 'package:flutter/material.dart';
import 'profile.dart';
void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title:Text("Food Express",),
            titleTextStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.greenAccent,fontSize: 16),
            centerTitle: true,          ),
body: Stack(
    children: [
      Center(
child:
Column(
    mainAxisSize: MainAxisSize.min,
      children:[
        Container(
      height: 350,
      child: Image.asset("images/delivery.jpg"),
      ),
          SizedBox(height: 20),
    Text("Delivery to your phone",style: TextStyle(color: Colors.greenAccent,
    fontWeight: FontWeight.bold,fontSize: 18
    ),
  textAlign: TextAlign.center,

    ),
          SizedBox(height:10),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text("Delivery is the process of transporting"
          " goods from a source location to a predefined"
          " destination.",textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16,color: Colors.black87),
      ),
    ),
  ],
),
        ),
   Positioned(bottom: 20,right: 20,
    child: ElevatedButton(onPressed: (){}, child: Text("Skip"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.greenAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        ),
    ),
    ),

 Positioned(
   bottom: 20,right: 20,
          child: ElevatedButton(onPressed: (){}, child: Text("Next"),
            style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
              foregroundColor: Colors.greenAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            ),
          ),
        ),
      ],
    ),
    ),


    );
  }
}