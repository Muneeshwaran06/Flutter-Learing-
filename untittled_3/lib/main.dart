// import 'package:flutter/material.dart';

// void main() {
//   runApp(untitled());
// }

// class untitled extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(appBar: AppBar(title: SafeArea(child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children:  [
//            Text("Find Your",style: TextStyle(fontWeight: FontWeight.bold,fontSize:20),
//                  softWrap: true,),
//            Text("Favorite Food",style: TextStyle(fontWeight: FontWeight.bold,fontSize:20),
//                  softWrap: true,),],
//       ), 
      
//         ), 
//         actions: [
//           IconButton(
//       icon: Icon(Icons.notification_add,color: Colors.greenAccent,),
            
//            onPressed: () {
//              print("hi");
//            },),
           
//         ],
//           ),
//           body: Container(
//             height: 150,
//             width: 500,
//             decoration: BoxDecoration(color: Colors.orangeAccent,
//             borderRadius:BorderRadius.all(Radius.circular(15)),
//             boxShadow: [
//               BoxShadow(
//                 blurRadius: 2,
//                 spreadRadius: 5,
//                 offset: Offset(0, 5),
//                 color: Colors.orangeAccent,
//               ),
//             ],
            
//             ),
//             child: IconButton(
//              icon: Icon(Icons.search,color: Colors.deepOrange,),
            
//             onPressed: (){
//               print("hello");
//             },),
//           ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            height: 55, // Adjusted for better proportions
            width: 320, // Slightly wider for a balanced UI
            padding: EdgeInsets.symmetric(horizontal: 15), // Inner padding for better spacing
            decoration: BoxDecoration(
              color: Colors.amber[50], // Soft yellow background
              borderRadius: BorderRadius.circular(30), // More rounded edges
              boxShadow: [
                BoxShadow(
                  blurRadius: 10, // Softer shadow
                  spreadRadius: 2,
                  offset: Offset(0, 4), // Better elevation effect
                  color: Colors.orange.withOpacity(0.3), 
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.orange, size: 26), // Search icon
                SizedBox(width: 10), // Space between icon and text
                Expanded( // Makes text responsive
                  child: Text(
                    "What do you want to order?",
                    style: TextStyle(
                      color: Colors.orange.shade700, // Slightly darker orange for better contrast
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
