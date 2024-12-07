import 'package:flutter/material.dart';
import 'package:sawemni/themes/colors.dart';
import 'package:sawemni/themes/styles.dart';


class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "الحساب الخاص",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        )),
        backgroundColor: orangeColor,
      ),
      body: SingleChildScrollView(  // Wrapping the entire body inside SingleChildScrollView
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // FIRST ICON
                  Column(
                    children: [
                      Container(
                        width: 70.0, // Set a fixed width
                        height: 70.0, // Set a fixed height
                        decoration: const BoxDecoration(
                          color: secondorange,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.local_offer,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10), // Add spacing
                      const Text(
                        "العروض",
                        style: addProductStyle,
                      ), // Add more widgets if needed
                    ],
                  ),
                  // SECOND ICON
                  Column(
                    children: [
                      Container(
                        width: 70.0, // Set a fixed width
                        height: 70.0, // Set a fixed height
                        decoration: const BoxDecoration(
                          color: secondorange,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.attach_money,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10), // Add spacing
                      const Text(
                        "مزيداتك",
                        style: addProductStyle,
                      ), // Add more widgets if needed
                    ],
                  ),

                  // THIRD ICON
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 70.0, // Set a fixed width
                        height: 70.0, // Set a fixed height
                        decoration: const BoxDecoration(
                          color: secondorange,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10), // Add spacing
                      const Text(
                        "المشتريات",
                        style: addProductStyle,
                      ), // Add more widgets if needed
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 2, // Line height
              color: grey, // Line color
              // Add padding
              width: double.infinity,
            ),

            // SETTINGS SECTION
            const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "منتجات المفضلة",
                    style: addProductStyle,
                  ),
                  SizedBox(width: 20,),
                  Icon(
                    Icons.favorite_border,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ),
            ),
            Container(
              height: 2, // Line height
              color: grey, // Line color
              // Add padding
              width: double.infinity,
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "المنتجات المحفوظة",
                    style: addProductStyle,
                  ),
                  SizedBox(width: 20,),
                  Icon(
                    Icons.bookmark_border,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ),
            ),

            Container(
              height: 2, // Line height
              color: grey, // Line color
              // Add padding
              width: double.infinity,
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "منتجاتك المعروضة",
                    style: addProductStyle,
                  ),
                  SizedBox(width: 20,),
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ),
            ),

            Container(
              height: 2, // Line height
              color: grey, // Line color
              // Add padding
              width: double.infinity,
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "مبيعاتك",
                    style: addProductStyle,
                  ),
                  SizedBox(width: 20,),
                  Icon(
                    Icons.shopping_cart_outlined,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ),
            ),
            Container(
              height: 2, // Line height
              color: grey, // Line color
              // Add padding
              width: double.infinity,
            ),
            SizedBox(height: 20,),

            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                 "حسابك الشخصي", 
                  style: addProductStyle,
                
                ),
                SizedBox(width: 20,),
              ],
            ),
            SizedBox(height: 10,),
            Container(
              height: 2, // Line height
              color: grey, // Line color
              // Add padding
              width: double.infinity,
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "تغيير كلمة السر",
                    style: addProductStyle,
                  ),
                  SizedBox(width: 20,),
                  Icon(
                    Icons.lock,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ),
            ),

            Container(
              height: 2, // Line height
              color: grey, // Line color
              // Add padding
              width: double.infinity,
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "تغيير رقم الهاتف",
                    style: addProductStyle,
                  ),
                  SizedBox(width: 20,),
                  Icon(
                    Icons.phone_android,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ),
            ),
            Container(
              height: 2, // Line height
              color: grey, // Line color
              // Add padding
              width: double.infinity,
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "تغيير العنوان",
                
                    style: addProductStyle,
                  ),
                  SizedBox(width: 20,),
                  Icon(
                    Icons.location_on,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ),
            ),
            Container(
              height: 2, // Line height
              color: grey, // Line color
              // Add padding
              width: double.infinity,
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "المعلومات الشخصية",
                    
                
                
                    style: addProductStyle,
                  ),
                  SizedBox(width: 20,),
                  Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ),
            ),
             Container(
              height: 2, // Line height
              color: grey, // Line color
              // Add padding
              width: double.infinity,
            ),
             const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                  "الخروج",
                
                    style: addProductStyle,
                  ),
                  SizedBox(width: 20,),
                  Icon(
                    Icons.exit_to_app,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
