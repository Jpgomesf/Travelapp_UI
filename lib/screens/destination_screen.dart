// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/destination_model.dart';

class DestinationScreen extends StatefulWidget {

  final Destination destination;

  DestinationScreen({required this.destination});

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius:  BorderRadius.circular(30.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ]
                ),
                child: Hero(
                  tag: widget.destination.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context), 
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context), 
                          icon: Icon(Icons.search),
                          iconSize: 30.0,
                          color: Colors.black,
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(context), 
                          icon: Icon(FontAwesomeIcons.arrowDownWideShort),
                          iconSize: 22.0,
                          color: Colors.black,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.destination.city,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          IconData(
                            0xf6f1, 
                            fontFamily: CupertinoIcons.iconFont, 
                            fontPackage: CupertinoIcons.iconFontPackage,
                          ),
                          size: 15.0,
                          color: Colors.white,
                        ),
                          
                        const SizedBox(width: 5.0,),
                          
                        Text(
                          widget.destination.country,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 20.0
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                right: 20.0,
                bottom: 20.0,
                child: Icon(
                  Icons.location_on,
                  color: Colors.white70,
                  size: 20.0,
                )
              )
            ],
          )
        ],
      ),
    );
  }
}