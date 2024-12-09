import 'package:flutter/material.dart';

class Basket extends StatefulWidget {
  const Basket({Key? key}) : super(key: key);

  @override
  _BasketState createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  final List<Item> allItems = const [
    Item(
      image: 'assets/shoe_blue.png',
      name: 'نايكي إير زوم بيغاسوس 36 ميامي',
      price: 'DZ 299,43',
      status: 'مرفوض',
      statusColor: Colors.red,
    ),
    Item(
      image: 'assets/shoe_red.png',
      name: 'نايكي إير زوم بيغاسوس 36 ميامي',
      price: 'DZ 299,43',
      status: 'مقبول',
      statusColor: Colors.green,
    ),
    Item(
      image: 'assets/shoe_blue.png',
      name: 'نايكي إير زوم بيغاسوس 36 ميامي',
      price: 'DZ 299,43',
      status: 'في طور الانتظار',
      statusColor: Colors.orange,
    ),
  ];

  List<Item> filteredItems = [];
  String selectedStatus = 'الكل';

  @override
  void initState() {
    super.initState();
    filteredItems = allItems;
  }

  void filterItems(String status) {
    setState(() {
      selectedStatus = status;
      if (status == 'الكل') {
        filteredItems = allItems;
      } else {
        filteredItems =
            allItems.where((item) => item.status == status).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('سلتك'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FilterChip(
                  label: Text('الكل'),
                  selected: selectedStatus == 'الكل',
                  onSelected: (_) => filterItems('الكل'),
                ),
                SizedBox(width: 8),
                FilterChip(
                  label: Text('مقبول'),
                  selected: selectedStatus == 'مقبول',
                  onSelected: (_) => filterItems('مقبول'),
                ),
                SizedBox(width: 8),
                FilterChip(
                  label: Text('مرفوض'),
                  selected: selectedStatus == 'مرفوض',
                  onSelected: (_) => filterItems('مرفوض'),
                ),
                SizedBox(width: 8),
                FilterChip(
                  label: Text('في طور الانتظار'),
                  selected: selectedStatus == 'في طور الانتظار',
                  onSelected: (_) => filterItems('في طور الانتظار'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return ItemCard(item: item);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
        ],
      ),
    );
  }
}

class Item {
  final String image;
  final String name;
  final String price;
  final String status;
  final Color statusColor;

  const Item({
    required this.image,
    required this.name,
    required this.price,
    required this.status,
    required this.statusColor,
  });
}

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Image.asset(item.image, width: 50, height: 50),
        title: Text(item.name, style: TextStyle(fontSize: 14.0)),
        subtitle: Text(item.price, style: TextStyle(color: Colors.blue)),
        trailing: Text(
          item.status,
          style:
              TextStyle(color: item.statusColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
