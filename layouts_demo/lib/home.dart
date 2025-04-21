import 'package:flutter/material.dart';
import 'Food_add.dart';
import 'Food_menu.dart';
import 'about.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _bottomNavIndex = 0;
  final List<Widget> _tabs =[
    const Food_menu(),
    const Food_add(),
    const about(),
  ];
  @override
  void initState(){
  super.initState();
_tabController = TabController(length: _tabs.length, vsync: this);
_tabController.addListener((){
  setState(() {
    _bottomNavIndex = _tabController.index;
  });
});
  }
  void _onBottomNavTapped(int index){
    setState(() {
      _bottomNavIndex = index;
      _tabController.index = index;
    });
  }
  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HomePage"),
        bottom: TabBar(controller: _tabController,
        tabs: const[
          Tab(icon: Icon(Icons.menu),text: 'Menu'),
          Tab(icon: Icon(Icons.menu),text: 'Add'),
          Tab(icon: Icon(Icons.menu),text: 'About'),
        ],
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: _tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        onTap: _onBottomNavTapped,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.menu),
          label: 'Menu',
          ),
        BottomNavigationBarItem(icon: Icon(Icons.add),
          label: 'Add',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.info),
          label: 'About',
        ),

        ],
      ),

      // mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         ElevatedButton(
      //           onPressed: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => const Food_menu()),
      //             );
      //           },
      //           child: const Text('Go to Menu'),
      //         ),
      //         ElevatedButton(
      //           onPressed: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => const Food_add()),
      //             );
      //           },
      //           child: const Text('Go to about'),
      //         ),
      //         ElevatedButton(
      //           onPressed: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => const about()),
      //             );
      //           },
      //           child: const Text('Go to About'),




    );
  }
}