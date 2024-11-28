import 'package:sawemni/data/repo/abstractsave.dart';

class saveProduct extends Abstractsave{
   Future<bool> saveProductInfo() async {
    //pretend that we are saving...
    await Future.delayed(Duration(seconds: 3));
    return true;
  }
}