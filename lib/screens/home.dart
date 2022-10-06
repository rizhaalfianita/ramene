import 'package:flutter/material.dart';
import 'package:ramene/constants.dart';
import 'package:ramene/models/ramens.dart';
import 'package:ramene/screens/chat.dart';
import 'package:ramene/screens/order.dart';
import 'package:ramene/screens/profile.dart';


class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List pages = [
    const ContainerHome(),
    Chat(),
    Order(),
    Profile(),
  ];

  int currentIndex = 0;
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_outlined), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_outlined), label: 'Order'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
        selectedItemColor: orangeAccent,
        unselectedItemColor: lightGrey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
      ),
      body: pages.elementAt(currentIndex),
    );
  }
}

class ContainerHome extends StatelessWidget {
  const ContainerHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: <Widget>[
          SizedBox(height: 40),
          TextField(
            controller: null,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Search ramen...',
              hintStyle: TextStyle(
                fontFamily: 'Poppins Light',
                color: lightGrey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: lightGrey),
              ),
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Top Menu",
              style: TextStyle(
                fontFamily: "Poppins Bold",
                fontSize: 17,
                color: darkGrey,
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              itemCount: ramens.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) => ItemCard(ramen: ramens[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Ramen ramen;
  const ItemCard({
    Key? key,
    required this.ramen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            // height: 170,
            // width: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(ramen.image),
              )
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          ramen.name,
          style: TextStyle(
            color: lightGrey,
            fontFamily: 'Poppins Light',
          ),
        ),
        SizedBox(height: 2),
        Text(
          ramen.price.toString(),
          style: TextStyle(
            color: darkGrey,
            fontFamily: 'Poppins Bold',
          ),
        ),
      ],
    );
  }
}