import 'package:flutter/material.dart';

void main() {

  runApp(
      Secondapp()
      );

}
// class Mainapp extends StatelessWidget{
//   String Displaytext = "hi";
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("change hi to bye"),
//         ),
//         body: Column(
//           children: [
//             Text(Displaytext),
//             MaterialButton(onPressed: (){
//               print(Displaytext);
//               Displaytext="bye";
//               print(Displaytext);
//             },
//               child: Text("click"),
//
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class Secondapp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Secondappstate();

  }
}
class Secondappstate extends State<Secondapp>{
  String Displaytext = "hi";
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("change hi to bye"),
        ),
        body: Column(
          children: [
            Text(Displaytext),
            MaterialButton(onPressed: (){
              setState(() {
                Displaytext="bye";
              });

              // print(Displaytext);
              // Displaytext="bye";
              // print(Displaytext);
            },
              child: Text("click"),

            )
          ],
        ),
      ),
    );
  }
}