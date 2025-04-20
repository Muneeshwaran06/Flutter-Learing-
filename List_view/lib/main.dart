import 'package:flutter/material.dart';

// void main() {
// runApp(MaterialApp(
//   home: Scaffold(
//     appBar: AppBar(
//       title: Text("List View"),
//     ),
//     body:ListView.builder(
//       itemCount: 10,
//         itemBuilder: (context,index){
//           return Text("Hello"+index.toString());
//         })
//
//
//
//
//     // Column(
//     //   children: [
//     //     Text("Hello"),
//     // Text("Hello"),
//     // Text("Hello"),
//     // Text("Hello"),
//     // Text("Hello"),
//     //   ],
//     // ),
//   ),
// ),);
//
// }

void main(){
  runApp(Secondapp());


}
class Secondapp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SecondappState();



  }
}
class SecondappState extends State<Secondapp>{
  List<String> fr=["Apple","orange","Mango"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
            itemCount: fr.length,
            itemBuilder: (context,index){
          return Text(fr[index]);

            //("hello world"+index.toString());

        }) ,
      ),
    );

  }
}


