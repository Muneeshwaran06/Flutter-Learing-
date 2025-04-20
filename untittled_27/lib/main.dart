import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:Colors.pinkAccent,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5)],
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.menu, size: 40, color: Colors.blue),
                  Text("row and columns", style: TextStyle(color: Colors.blue)),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Add", style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ),

           Expanded(child:
            PageView(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(4, 4),),
                  ],
                  ),
                  height: 90,
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      
                      Text("samsung",style: TextStyle(color: Colors.blue,fontSize: 100,),),
                      Text("A23 Ultra",style: TextStyle(color: Colors.blue,fontSize: 100),),
                      Text("@28000",style: TextStyle(color: Colors.blue,fontSize: 100),),
                    ],
                  ),
                ),
                 Container(
                  decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(4, 4),),
                  ],
                  ),
                  height: 90,
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     Text("samsung",style: TextStyle(color: Colors.blue,fontSize: 100),),
                      Text("A23 Ultra",style: TextStyle(color: Colors.blue,fontSize: 100),),
                      Text("@28000",style: TextStyle(color: Colors.blue,fontSize: 100),),
                    ],
                  ),
                ),
                 Container(
                  decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(4, 4),),
                  ],
                  ),
                  height: 90,
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     Text("samsung",style: TextStyle(color: Colors.blue,fontSize: 100),),
                      Text("A23 Ultra",style: TextStyle(color: Colors.blue,fontSize: 100),),
                      Text("@28000",style: TextStyle(color: Colors.blue,fontSize: 100),),
                    ],
                  ),
                ),
                 Container(
                  decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(4, 4),),
                  ],
                  ),
                  height: 90,
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("samsung",style: TextStyle(color: Colors.blue,fontSize: 100),),
                      Text("A23 Ultra",style: TextStyle(color: Colors.blue,fontSize: 100),),
                      Text("@28000",style: TextStyle(color: Colors.blue,fontSize: 100),),
                    ],
                  ),
                ),
                 Container(
                  decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(4, 4),),
                  ],
                  ),
                  height: 90,
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("samsung",style: TextStyle(color: Colors.blue,fontSize: 100),),
                      Text("A23 Ultra",style: TextStyle(color: Colors.blue,fontSize: 100),),
                      Text("@28000",style: TextStyle(color: Colors.blue,fontSize: 100),),
                    ],
                  ),
                ),
                 Container(
                  decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(4, 4),),
                  ],
                  ),
                  height: 90,
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("samsung",style: TextStyle(color: Colors.blue,fontSize: 100),),
                      Text("A23 Ultra",style: TextStyle(color: Colors.blue,fontSize: 100),),
                      Text("@28000",style: TextStyle(color: Colors.blue,fontSize: 100),),
                    ],
                  ),
                ),
                 Container(
                  decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(4, 4),),
                  ],
                  ),
                  height: 90,
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     Text("samsung",style: TextStyle(color: Colors.blue,fontSize: 100),),
                      Text("A23 Ultra",style: TextStyle(color: Colors.blue,fontSize: 100),),
                      Text("@28000",style: TextStyle(color: Colors.blue,fontSize: 100),),
                    ],
                  ),
                ),
                 Container(
                  decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(4, 4),),
                  ],
                  ),
                  height: 90,
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("samsung",style: TextStyle(color: Colors.blue,fontSize: 100),),
                      Text("A23 Ultra",style: TextStyle(color: Colors.blue,fontSize: 100),),
                      Text("@28000",style: TextStyle(color: Colors.blue,fontSize: 100,),),
                    ],
                  ),
                ),
              ],
            ),
           ),
          ],
          
        ),  
    ),
    );
  }
}
