// import 'package:flutter/material.dart';

// void main() {
//   runApp(Myapp());
// }

// class Myapp extends StatefulWidget {
//   @override
//   State<Myapp> createState() => _MyappState();
// }

// class _MyappState extends State<Myapp> {
//   String display = "No text data";

//   TextEditingController textController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("todo"),
//           backgroundColor: Colors.blue,
//           foregroundColor: Colors.white,
//           centerTitle: true,
//         ),
//         body: Column(
//           children: [

// Row(

// children: [
//   Expanded(child:   Container(
//               padding: EdgeInsets.all(10),
//               child: TextField(
//                 controller: textController,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   label: Text("Enter Name"),
//                 ),
//               ),
//             ),
//   ),

//             MaterialButton(
//               color: Colors.white,
//               height: 50,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               onPressed: () {
//                 setState(() {
//                   display = textController.text;
//                 });
//               },
//               child: Text("click"),
//             ),

//             Text(display),

//             Container(
//               child: Row(
//                 children: [
//                   Container(
//                     child: Text("hello"),

//                   )
//                 ],
//               ),

//             )
// ],
// )

//           ],

//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

void mainApp() {
  runApp(muneesh());
}

class muneesh extends StatefulWidget {
  @override
  State<muneesh> createState() => _muneeshState();
}

class _muneeshState extends State<muneesh> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: [
              Tab(icon: IconButton(onPressed: () {}, icon: Icon(Icons.menu))),
            ],
          ),
        ),
      ),
    );
  }
}



































































































// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: Scaffold(appBar: AppBar(title: Text("feilds"))));
//   }
// }

// class TextFieldExample extends StatefulWidget {
//   const TextFieldExample({super.key});
//   @override
//   _TextFieldExampleState createState() => _TextFieldExampleState();
// }

// class _TextFieldExampleState extends State<TextFieldExample> {
//   final TextEditingController _controller = TextEditingController();

//   void _showInput() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Entered Text"),
//           content: Text(_controller.text),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("ok"),
//             ),
//           ],
//         );
//       },
//     );
  

//     body:
//     Padding(
//       padding: EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           TextField(
//             controller: _controller,
//             decoration: InputDecoration(
//               labelText: 'Enter Name',
//               border: OutlineInputBorder(),
//             ),
//           ),
//           SizedBox(height: 10),
//           ElevatedButton(onPressed: _showInput, child: Text("Show Output")),
//         ],
//       ),
//     );
//   }
// }

         
         
         
          // SizedBox  (height: 10,),
          // ElevatedButton(onPressed: _showInput, child: Text(data))
