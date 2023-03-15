import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  StreamController<String> _streamController = StreamController<String>();
  TextEditingController _text = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      //appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  'Welcome',
                  style: GoogleFonts.sacramento(
                      textStyle: const TextStyle(
                          color: Color(0xffc7021b),
                          fontSize: 90)),
                ),
                SizedBox(
                  width: w/1.2,
                  height: h/3,
                  child: SingleChildScrollView(
                    child: StreamBuilder<String>(
                      stream: _streamController.stream,
                      builder: (context, snapshot) {
                        if(snapshot.hasData){
                          return Text(
                            snapshot.data.toString(),
                            style: GoogleFonts.sacramento(
                                textStyle: const TextStyle(
                                    color: Color(0xffc7021b),
                                    fontSize: 70)),
                          );
                        }else{
                          return Text(
                           'Enter something',
                            style: GoogleFonts.sacramento(
                                textStyle: const TextStyle(
                                    color: Color(0xffc7021b),
                                    fontSize: 70)),
                          );
                        }
                      }
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: const Color(0xffc7021b)),
                          borderRadius: BorderRadius.circular(50)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextField(
                          controller: _text,
                          onChanged: (val) {
                          _streamController.add(_text.text);
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter Something',
                              hintStyle: GoogleFonts.kumbhSans()),
                        ),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
