import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final TextEditingController _SearchController = TextEditingController();
  bool _isSearching = false;

  @override
  void dispose() {
    _SearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.purple, Colors.blue]),
            ),
          ),
          title:
              _isSearching
                  ? TextField(
                    controller: _SearchController,
                    autofocus: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "search",
                      hintStyle: TextStyle(color: Colors.white70),
                      border: InputBorder.none,
                    ),
                  )
                  : const Text(
                    "hi,hello",
                    style: TextStyle(color: Colors.white),
                  ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu, color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
                setState(() {
                  _isSearching = !_isSearching;
                  if (!_isSearching) {
                    _SearchController.clear();
                  }
                });
              },
            ),
            //IconButton(onPressed: (){}, icon: Icon(Icons.))
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.home), text: "home"),
            Tab(icon: Icon(Icons.account_circle), text: "profile"),
            Tab(icon: Icon(Icons.settings), text: "settings"),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
          ),

          // // child: TabBarView(
          // //   children: [
          // //     Container(
          // //       decoration: BoxDecoration(
          // //         color: Colors.blue,
          // //         borderRadius: BorderRadius.circular(2),
          // //         boxShadow:[
          // //           BoxShadow(
          // //                   blurRadius:1 ,
          // //           spreadRadius:5 ,
          // //           offset: Offset(0, 4),
          // //           color: Colors.black26
          // //           )
          // //         ]

          // //       ),
          // //       margin: EdgeInsets.all(2),
          // //       child: Column(
          // //         crossAxisAlignment: CrossAxisAlignment.start,
          // //         children: [
          // //           Text("A Sammer Suprise"),
          // //           Text("Cashback 20%"),
          // //         ],

          // //       ),
        ),
      ),
    );
  }
}
