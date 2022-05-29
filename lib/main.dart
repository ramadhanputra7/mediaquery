import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final myAppBar = AppBar(
      title: Text("Media Query"),
    );
    final bodyheight = mediaQueryHeight -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      appBar: myAppBar,
      body: Center(
        child: (isLandscape)
            ? Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(0),
                    height: bodyheight * 0.7,
                    width: mediaQueryWidth,
                    color: Colors.black,
                    child: Image.asset(
                      "images/wendys.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                      height: bodyheight * 0.3,
                      width: mediaQueryWidth,
                      color: Colors.blue,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemCount: 100,
                        itemBuilder: (context, index) {
                          return GridTile(
                              child: Container(
                            color: Color.fromARGB(255, Random().nextInt(150),
                                Random().nextInt(150), Random().nextInt(150)),
                          ));
                        },
                      )),
                ],
              )
            : Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(0),
                    height: bodyheight * 0.25,
                    width: double.maxFinite,
                    color: Colors.black,
                    child: Image.asset(
                      "images/wendys.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                      height: bodyheight * 0.75,
                      color: Colors.blue,
                      child: ListView.builder(
                        itemCount: 100,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(),
                            title: Text("Halo Semua.."),
                          );
                        },
                      )),
                ],
              ),
      ),
    );
  }
}
