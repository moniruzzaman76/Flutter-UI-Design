import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  List<Widget>pageList = const [
    Text("page Number 1"),
    Text("Page Number 2",),
    Text("Page Number 3",),
  ];

  void onTabTapped(int index){
    setState(() {
      selectedIndex = index;
    });
  }


  Color _getFloatingActionButtonColor(int index) {
    if (index == 0) {
      return Colors.red;
    } else if (index == 1) {
      return Colors.green;
    } else if (index == 2) {
      return Colors.blueGrey;
    } else {
      return Colors.blue;
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: const Color(0xff764abc),
          centerTitle: true,
          toolbarHeight: 60,
          title: const Text(
            "Flutter App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                padding: const EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(color: Colors.green),
                  accountName: const Text(
                    "Ariyan Khan Monir",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  accountEmail: const Text(
                    "ariyankhanmonir111@gmail.com",
                    style: TextStyle(color: Colors.black),
                  ),
                  currentAccountPicture: Image.asset("assets/images/monir.jpg"),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                onTap: () {
                  onTabTapped(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text("Phone"),
                onTap: () {
                  onTabTapped(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Setting"),
                onTap: () {
                  onTabTapped(2);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: selectedIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.phone), label: "Phone"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Setting"),
          ],
        ),
        body: Center(
            child: pageList[selectedIndex]
        ),
        floatingActionButton: FloatingActionButton(
           backgroundColor:_getFloatingActionButtonColor(selectedIndex),
            onPressed: () {  },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}