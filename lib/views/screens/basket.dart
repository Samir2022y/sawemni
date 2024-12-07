import 'package:flutter/material.dart';

class Basket extends StatelessWidget {
  const Basket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'سلتك',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                CartItem(
                  name: 'نايكي إير زوم بيغاسوس 36 ميامي',
                  price: 299.43,
                ),
                CartItem(
                  name: 'نايكي إير زوم بيغاسوس 36 ميامي',
                  price: 299.43,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'أدخل رمز القسيمة',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: Size(80, 48),
                      ),
                      child: Text(
                        'وضع',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('عناصر (3)', style: TextStyle(fontSize: 16)),
                    Text('DZ 598.86', style: TextStyle(fontSize: 16)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('شحن', style: TextStyle(fontSize: 16)),
                    Text('DZ 40.00', style: TextStyle(fontSize: 16)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('رسوم', style: TextStyle(fontSize: 16)),
                    Text('DZ 128.00', style: TextStyle(fontSize: 16)),
                  ],
                ),
                Divider(thickness: 1, color: Colors.grey),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'السعر الإجمالي',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'DZ 766.86',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('تأكد',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem extends StatefulWidget {
  final String name;
  final double price;

  const CartItem({
    required this.name,
    required this.price,
    Key? key,
  }) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quantity = 1;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:
          EdgeInsets.symmetric(vertical: 4, horizontal: 12), // Reduced margin
      child: Padding(
        padding: const EdgeInsets.all(6.0), // Reduced padding
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 60, // Smaller image size
              height: 60, // Smaller image size
              margin: EdgeInsets.all(6.0), // Reduced margin
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[300], // Placeholder color
              ),
              child: Center(
                child: Icon(
                  Icons.image,
                  size: 30, // Smaller icon size
                  color: Colors.grey[700],
                ),
              ),
            ),
            SizedBox(width: 12), // Reduced space between image and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name,
                      style: TextStyle(fontSize: 14)), // Smaller font size
                  Text(
                    'DZ ${(widget.price * quantity).toStringAsFixed(2)}',
                    style: TextStyle(
                        color: Colors.blue, fontSize: 14), // Smaller font size
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.add, size: 16), // Smaller icon size
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                    Text('$quantity',
                        style: TextStyle(fontSize: 14)), // Smaller font size
                    IconButton(
                      icon: Icon(Icons.remove, size: 16), // Smaller icon size
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                          });
                        }
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.grey,
                        size: 20, // Smaller icon size
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete,
                          color: Colors.red, size: 20), // Smaller icon size
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('تأكيد الحذف'),
                              content:
                                  Text('هل أنت متأكد أنك تريد حذف هذا العنصر؟'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('إلغاء'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Implement delete logic
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('حذف'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
