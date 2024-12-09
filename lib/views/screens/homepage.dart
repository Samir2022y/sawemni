import 'package:flutter/material.dart';
import 'package:sawemni/views/screens/search.dart';
import 'package:sawemni/views/screens/detailedProduct.dart'; // Assuming you'll create this file

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'الجميع';
  String sortCriteria = 'Price High to Low';
  final ScrollController _scrollController = ScrollController();
  List<Map<String, dynamic>> products = [
    {
      'title': 'سيارة',
      'price': 20.00,
      'date': DateTime(2023, 12, 1),
      'imageUrl': 'https://via.placeholder.com/150',
      'rating': 3,
      'reviews': 10,
      'details': 'تفاصيل السيارة'
    },
    {
      'title': 'حافلة',
      'price': 30.00,
      'date': DateTime(2023, 11, 15),
      'imageUrl': 'https://via.placeholder.com/150',
      'rating': 0,
      'reviews': 0,
      'details': 'تفاصيل الحافلة'
    },
    {
      'title': 'دراجة هوائية',
      'price': 30.00,
      'date': DateTime(2023, 11, 20),
      'imageUrl': 'https://via.placeholder.com/150',
      'rating': 0,
      'reviews': 0,
      'details': 'تفاصيل الدراجة الهوائية'
    },
    {
      'title': 'جهاز تلفاز',
      'price': 50.00,
      'date': DateTime(2023, 10, 25),
      'imageUrl': 'https://via.placeholder.com/150',
      'rating': 4,
      'reviews': 25,
      'details': 'تفاصيل جهاز التلفاز'
    },
    {
      'title': 'حاسوب محمول',
      'price': 100.00,
      'date': DateTime(2023, 9, 10),
      'imageUrl': 'https://via.placeholder.com/150',
      'rating': 5,
      'reviews': 50,
      'details': 'تفاصيل الحاسوب المحمول'
    },
    {
      'title': 'هاتف ذكي',
      'price': 70.00,
      'date': DateTime(2023, 8, 5),
      'imageUrl': 'https://via.placeholder.com/150',
      'rating': 4,
      'reviews': 40,
      'details': 'تفاصيل الهاتف الذكي'
    },
    {
      'title': 'ثلاجة',
      'price': 200.00,
      'date': DateTime(2023, 7, 1),
      'imageUrl': 'https://via.placeholder.com/150',
      'rating': 3,
      'reviews': 15,
      'details': 'تفاصيل الثلاجة'
    },
    {
      'title': 'ميكروويف',
      'price': 150.00,
      'date': DateTime(2023, 6, 18),
      'imageUrl': 'https://via.placeholder.com/150',
      'rating': 4,
      'reviews': 20,
      'details': 'تفاصيل الميكروويف'
    },
    {
      'title': 'غسالة',
      'price': 300.00,
      'date': DateTime(2023, 5, 10),
      'imageUrl': 'https://via.placeholder.com/150',
      'rating': 5,
      'reviews': 30,
      'details': 'تفاصيل الغسالة'
    },
    {
      'title': 'مكنسة كهربائية',
      'price': 250.00,
      'date': DateTime(2023, 4, 20),
      'imageUrl': 'https://via.placeholder.com/150',
      'rating': 4,
      'reviews': 18,
      'details': 'تفاصيل المكنسة الكهربائية'
    },
  ];

  void showCategoryFilterDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: [
            ListTile(
              title: Text('الجميع'),
              onTap: () {
                setState(() {
                  selectedCategory = 'الجميع';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('سيارة'),
              onTap: () {
                setState(() {
                  selectedCategory = 'سيارة';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('حافلة'),
              onTap: () {
                setState(() {
                  selectedCategory = 'حافلة';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('دراجة هوائية'),
              onTap: () {
                setState(() {
                  selectedCategory = 'دراجة هوائية';
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void showSortDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: [
            ListTile(
              title: Text('من الأعلى سعراً إلى الأقل'),
              onTap: () {
                setState(() {
                  sortCriteria = 'Price High to Low';
                  sortProducts();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('من الأقل سعراً إلى الأعلى'),
              onTap: () {
                setState(() {
                  sortCriteria = 'Price Low to High';
                  sortProducts();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('من الأحدث إلى الأقدم'),
              onTap: () {
                setState(() {
                  sortCriteria = 'Newest to Oldest';
                  sortProducts();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('من الأقدم إلى الأحدث'),
              onTap: () {
                setState(() {
                  sortCriteria = 'Oldest to Newest';
                  sortProducts();
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void sortProducts() {
    setState(() {
      if (sortCriteria == 'Price High to Low') {
        products.sort((a, b) => b['price'].compareTo(a['price']));
      } else if (sortCriteria == 'Price Low to High') {
        products.sort((a, b) => a['price'].compareTo(b['price']));
      } else if (sortCriteria == 'Newest to Oldest') {
        products.sort((a, b) => b['date'].compareTo(a['date']));
      } else if (sortCriteria == 'Oldest to Newest') {
        products.sort((a, b) => a['date'].compareTo(b['date']));
      }
    });
  }

  void autoScrollToEnd() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(seconds: 2),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = selectedCategory == 'الجميع'
        ? products
        : products
            .where((product) => product['title'] == selectedCategory)
            .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'المعرض',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.black),
            onPressed: showCategoryFilterDialog,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.sort, color: Colors.black),
                  onPressed: showSortDialog,
                ),
                IconButton(
                  icon: Icon(Icons.arrow_downward, color: Colors.black),
                  onPressed: autoScrollToEnd,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              controller: _scrollController,
              children: filteredProducts.map((product) {
                return ProductItem(
                  imageUrl: product['imageUrl'],
                  title: product['title'],
                  price: product['price'].toString(),
                  publishTime: product['date'].toString(),
                  rating: product['rating'],
                  reviews: product['reviews'],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detailedproduct(),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['title']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product['imageUrl'],
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              product['title'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'السعر: ${product['price']} دج',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(height: 8),
            Text(
              'تاريخ النشر: ${product['date'].toString().substring(0, 10)}',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Text(
              product['details'],
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Example action: Add to cart
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('تمت الإضافة إلى السلة!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart),
                  SizedBox(width: 8),
                  Text('إضافة إلى السلة'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String publishTime;
  final int rating;
  final int reviews;
  final VoidCallback onTap;

  const ProductItem({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.publishTime,
    required this.rating,
    required this.reviews,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'السعر: $price دج',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'تاريخ النشر: $publishTime',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              index < rating ? Icons.star : Icons.star_border,
                              size: 16,
                              color: Colors.orange,
                            );
                          }),
                        ),
                        SizedBox(width: 8),
                        Text('($reviews)', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
