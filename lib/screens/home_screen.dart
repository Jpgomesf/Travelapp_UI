// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/widgets/hotel_carousel.dart';

import '../widgets/destination_caroulsel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;
  int _currentTab = 0;

  final List<IconData> _icons = [
      FontAwesomeIcons.plane,
      FontAwesomeIcons.bed,
      FontAwesomeIcons.personWalking,
      FontAwesomeIcons.car,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        //print(_selectedIndex);
      },
      child: Container(
        height: 60.0, 
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index 
            ?Theme.of(context).colorScheme.secondary 
            :Color(0xFFE7EBEE), 
          borderRadius: BorderRadius.circular(30.0)
        ),
        child: Icon(_icons[index], 
          size: 25.0,
          color: _selectedIndex == index 
            ?Theme.of(context).primaryColor
            :Color(0xFFB4C1C4), 
        ),
      ),
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Travel Ui', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 1,
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Color(0xFF3EBACE), statusBarIconBrightness: Brightness.dark),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0,),
              child: Text(
                'What would you like to find', 
                style: TextStyle(
                  fontSize: 30.0, 
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                .asMap()
                .entries
                .map(
                  (MapEntry map) => _buildIcon(map.key),
                )
                .toList(),
            ),

            SizedBox(height: 20.0,),

            DestinationCarousel(),

            SizedBox(height: 20.0,),

            HotelCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        selectedFontSize: 0,
        onTap: (int value) {
          setState(() {
            _currentTab =  value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_pizza
            ),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15.0,
              backgroundImage: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
            ),
            label: ''
          ),
        ],
      ),
    );
  }
}
