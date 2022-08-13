import 'package:flutter/material.dart';

import 'item_screen.dart';
class DashbaordScreen extends StatefulWidget {
  const DashbaordScreen({Key? key}) : super(key: key);

  @override
  State<DashbaordScreen> createState() => _DashbaordScreenState();
}

class _DashbaordScreenState extends State<DashbaordScreen> {
  var data={
    'image': 'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',
    'email' : 'john@gmail.com',
    'welcome' : 'Welcome to Demo App',
    'name' : 'John Doe',
    'message' : 'A good example of a paragraph contains a topic sentence, details and a conclusion. There are many different kinds of animals that live in China. Tigers and leopards are animals that live in Chinas forests in the north. In the jungles, monkeys swing in the trees and elephants walk through the brush',
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.blue
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: CircleAvatar(
              radius: 60,
            backgroundImage: NetworkImage(data['image'].toString()),),
          ),
          SizedBox(
            height: 20,
          ),
          Text(data['name'].toString(), style: TextStyle(color: Colors.blue ,
          fontSize: 30 , fontWeight: FontWeight.bold),),
          SizedBox(
            height: 10,
          ),
          Text(data['email'].toString(), style: TextStyle(color: Colors.blue ,
              fontSize: 16 ),),
          SizedBox(
            height: 40,
          ),
          Text(data['welcome'].toString(), style: TextStyle(color: Colors.blue ,
              fontSize: 16 , fontWeight: FontWeight.bold),),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70.0),
            child: Text(data['message'].toString(), textAlign: TextAlign.center, ),
          ),
          SizedBox(
            height: 100,
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ItemScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.blue
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('EXPLORE MORE', style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold ,
                      fontSize: 20),),
                ),
              ),
            ),
          )


        ],
      ),
      drawer: Drawer(),
    );
  }
}
