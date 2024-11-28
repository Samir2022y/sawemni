import 'package:flutter/material.dart';
import 'package:sawemni/views/screens/addproduct.dart';
import 'views/screens/landing.dart';
import 'views/screens/basket.dart';
import 'views/screens/search.dart';
import 'views/screens/profile.dart';
import 'package:sawemni/data/repo/save.dart';


late saveProduct saveProductInfo;
void main() async{
    WidgetsFlutterBinding.ensureInitialized();

  await my_init_app();
  runApp(const MainApp());
}
Future<bool> my_init_app() async {
  //some initialization here...<
  saveProductInfo = saveProduct();
  
  return true;
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      
      home: Homescreen(),
      routes: {
        '/homeScreen': (context) => Homescreen(),  
        '/basketScreen' : (context) => Basket(),
        '/addProduct': (context) => Addproduct(),  
        '/search' : (context) => Search(), 
        '/profile' : (context) => Profile(), 
      },
    );
  }
}
