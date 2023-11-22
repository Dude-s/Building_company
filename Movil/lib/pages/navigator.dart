import 'package:building_company/pages/home.dart';
import 'package:building_company/pages/reportes.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';


class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  int _selectedIndex = 0;
  final _screens = [
    Home(),
    Reportes(),
    Text( 'School')
  ];

  @override
  Widget build(BuildContext context) {

    final items = <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.file_copy, size: 30),
      Icon(Icons.school, size: 30),
    ];


    return Scaffold(
      backgroundColor: Colors.grey[300],

      body: _screens[_selectedIndex],

      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        index: _selectedIndex,
        items: items,
        onTap: (index) => setState(() => this._selectedIndex = index),
      ),


    );
  }
}
    /*return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Color(0xFF1465BB), 
          title: const Text('Material App Bar'),
        ),
        body: _screens[_selectedIndex],
        bottomNavigationBar:  CurvedNavigationBar(

          key: navigationKey,

          height: 60,

          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),

          index: _selectedIndex,
          items: items,
          //onTap: (index) => setState(() => this._selectedIndex = index),
        )
      )
    );
  }
}

/*bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
                setState(() {
                  _selectedIndex = index;
                });
              },
          currentIndex: _selectedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.file_copy),
              label: 'Reportes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',

            ),
            
          ],
          selectedItemColor: Color(0xFF1465BB),
        ),*/*/

