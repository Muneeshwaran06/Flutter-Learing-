import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Scaffold(
//         body:Row(
//   mainAxisAlignment: MainAxisAlignment.center, // Centers items
//   children: [
//     Icon(Icons.star, size: 40, color: Colors.blue),
//     SizedBox(width: 10), // Adds spacing between items
//     Text('Hello, Row!', style: TextStyle(fontSize: 18)),
//   ],
// )

//       ),
//     );
//   }
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("rows"),
        ),
        body: Center(child: Container(padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black26,blurRadius: 5),
        ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.star,size: 40,color: Colors.blue),
            Text("rows and columns",style: TextStyle(fontSize: 20),),
            ElevatedButton(onPressed: (){}, child: Text("click me"),
            ),
                      ],
        ),
        ),
        ),
      ),
    );
  }
}
