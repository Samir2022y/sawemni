 import 'package:flutter/material.dart';
 import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

 Widget bottomNavigation(int currentIndex, ValueChanged<int>? onTabTapped){
 return  Container(
        height: 100,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              label: '',
              
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 30,
                )),
            BottomNavigationBarItem(
                          label: '',
        
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 30.0,
                )),
           
                BottomNavigationBarItem(
                              label: '',
        
                icon: Icon(
                  Icons.add_circle,
                  color: Colors.white,
                  size: 30.0,
                )),
                 BottomNavigationBarItem(
                          label: '',
        
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30.0,
                )),
                             BottomNavigationBarItem(
                                          label: '',
        
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30.0,
                )),
        
                
          ],
          currentIndex: currentIndex,
          onTap: onTabTapped,
          backgroundColor: Colors.orange,
        
        ),
      );
 }

Widget bidOffer(String productName, String userName, double price) {
  return Container(
    decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(
      color: Colors.grey,
      width: 2,
    ))),
    foregroundDecoration: const RotatedCornerDecoration.withColor(
      color: Colors.orange,
      badgeSize: Size(100, 100),
      textSpan: TextSpan(
        text: ' مزايدات',
        style: TextStyle(fontSize: 18, height: 1.7, color: Colors.white),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 60),
                    //   child: Text(' $productName', style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600), softWrap: true,),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(right: 60, top: 10),
                      child: Text('السعر : $price ',
                          style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, top: 10),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: userName,
                          style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(
                            text: '  قام بالمزايدة على ',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            )),
                        TextSpan(
                          text: productName,
                          style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ])),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Image.asset('images/running.jpg',
                        width: 100, height: 80, fit: BoxFit.cover)),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget offer(String productName, String userName, double price) {
  return Container(
    decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(
      color: Colors.grey,
      width: 2,
    ))),
    foregroundDecoration: const RotatedCornerDecoration.withColor(
      color: Color.fromARGB(255, 97, 239, 215),
      badgeSize: Size(100, 100),
      textSpan: TextSpan(
        text: ' طلبات',
        style: TextStyle(fontSize: 18, height: 1.7, color: Colors.white),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 60, top: 10),
                      child: Text('السعر : $price ',
                          style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, top: 10),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: userName,
                          style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(
                            text: '  قام بتقديم عرض على ',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            )),
                        TextSpan(
                          text: productName,
                          style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ])),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Image.asset('images/running.jpg',
                        width: 100, height: 80, fit: BoxFit.cover)),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget acceptedOffer(String productName, String userName, double price) {
  return Container(
    decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(
      color: Colors.grey,
      width: 2,
    ))),
    foregroundDecoration: const RotatedCornerDecoration.withColor(
      color: Color.fromARGB(255, 69, 237, 75),
      badgeSize: Size(100, 100),
      textSpan: TextSpan(
        text: ' عرض مقبول',
        style: TextStyle(fontSize: 18, height: 1.7, color: Colors.white),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 60, top: 10),
                      child: Text('السعر : $price ',
                          style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, top: 10),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: userName,
                          style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(
                            text: '  قام بقبول عرضك على ',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            )),
                        TextSpan(
                          text: productName,
                          style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ])),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Image.asset('images/running.jpg',
                        width: 100, height: 80, fit: BoxFit.cover)),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
