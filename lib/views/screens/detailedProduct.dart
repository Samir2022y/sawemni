import 'package:flutter/material.dart';
import 'package:sawemni/views/screens/basket.dart';
import 'package:sawemni/views/screens/productInfo.dart';
import '../widgets/widgets.dart';
import 'profile.dart';
import 'search.dart';
import 'notificationpage.dart';
import 'addproduct.dart';
class Detailedproduct extends StatefulWidget {
  const Detailedproduct({super.key});

  @override
  State<Detailedproduct> createState() => _DetailedproductState();
}

class _DetailedproductState extends State<Detailedproduct> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Container(
          child: AppBar(
      
      flexibleSpace: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Image.asset('images/sawemni.jpg', width: 150),
          ),
  Row(
            children: [
              GestureDetector(
                onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return Notificationpage(
                           
                          );
                    }));
                },
                child: Icon(Icons.notifications, color: Colors.orange)),
              SizedBox(width: 10), // Adds space between the two icons
              Icon(Icons.menu, color: Colors.orange),
            ],
          ),
        ],
            ),
      ),
            backgroundColor: Colors.white,
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: const [
          ProductInfo(),
          Basket(),
          Addproduct(),
          Search(),
          Profile(),
        ],
      ),
      bottomNavigationBar: bottomNavigation(currentIndex, onTabTapped),
    );
  }
}