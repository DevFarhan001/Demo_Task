import 'package:flutter/material.dart';
class ItemScreen extends StatefulWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  var items={
    'image' : 'https://images.unsplash.com/photo-1581655353564-df123a1eb820?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    'title' : 'Snoppy T-shirt',
    'desc' : 'This is very Cool Shirt',
    'price' : '\$40',
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
      drawer: Drawer(),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context , i){
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(items['image'].toString() , height: 130,)),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Text(items['title'].toString(), style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24,
                      ),),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(items['desc'].toString()),
                    SizedBox(height: 10,),
                    Text(items['price'].toString(), style: TextStyle(color: Colors.blue,fontSize: 24,
                    fontWeight: FontWeight.bold),)
                  ],
                )

              ],
            ),
          ),
        );
      }),
    );
  }
}
