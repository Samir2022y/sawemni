import 'package:flutter/material.dart';
import '/themes/colors.dart'; // Ensure this is configured correctly

class ProductInfo extends StatefulWidget {
  const ProductInfo({super.key});

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  double currentPrice = 100.0; 
  final TextEditingController bidController = TextEditingController();

 void _showBidDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('أضف عرض السعر',
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 157, 99, 33)) // Adjusted font size
              ),
          content: Container(
            width: 300, // Adjust dialog width
            height: 150, // Adjust dialog height
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'السعر الحالي: $currentPrice دج',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 25, color: Colors.black), // Adjusted font size
                ),
                TextField(
                  controller: bidController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'أدخل السعر الجديد',
                    labelStyle: TextStyle(fontSize: 30),
                    alignLabelWithHint: true,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('إلغاء', style: TextStyle(color: Colors.red, fontSize: 25)),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('إضافة', style: TextStyle(color: Colors.green, fontSize: 25)),
              onPressed: () {
                if (bidController.text.isNotEmpty) {
                  double? newPrice = double.tryParse(bidController.text);
                  if (newPrice != null && newPrice > currentPrice) {
                    setState(() {
                      currentPrice = newPrice;
                    });
                    Navigator.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('يرجى إدخال سعر أعلى من السعر الحالي')),
                    );
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final List<Map<String, dynamic>> comments = [
      {
        'name': 'محمد',
        'text':
            '   المنتج رائع جدًا! أوصي به بشدة. اااااااااااااااااااااااااااااااااااااااااااااااااابتبمنالاتنىمبتيسباللامنتبيىلماسنلاىصتلسىلمهلاىهسعمثقلاهمتيامعىلالاااااااااااااااااااااااااااااااااااااااااااااااا',
        'date': DateTime.now()
      },
      {
        'name': 'سارة',
        'text': 'الجودة ممتازة، ولكن السعر مرتفع قليلاً.',
        'date': DateTime(2024, 12, 1, 14, 30)
      },
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
      
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: const Image(
                      image: AssetImage('assets/Khorda.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'اسم المنتج',
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w800),
                    ),
                    const Spacer(),
                    ...List.generate(
                      4,
                      (index) => const Icon(Icons.star, color: Colors.orange),
                    ),
                    const Icon(Icons.star_border, color: Colors.grey),
                    const SizedBox(width: 10),
                    const Text(
                      '4.3',
                      style: TextStyle(fontSize: 23, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'الصنف',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                Row(
  mainAxisAlignment: MainAxisAlignment.start,
                children:[Text('$currentPrice دج', style:TextStyle(fontSize: 30,
                color: primaryColor),
                ),]),
                const Text(
                  'وصف',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const Text(
                  'هذا نص شكلي يتم استخدامه لملء الفراغات في التصاميم والعروض...',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
                const SizedBox(height: 20),
                const Text(
                  'التعليقات',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                for (var comment in comments) CommentWidget(comment: comment),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'اضف تعليقك...',
                                  border: InputBorder.none,
                                  fillColor: Colors.transparent,
                                ),
                                maxLines: null,
                                minLines: 1,
                                keyboardType: TextInputType.multiline,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.send, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                        onPressed: _showBidDialog,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          textStyle: const TextStyle(
                              fontSize: 20, color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'قم بالمزايدة ',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart, size: 30),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CommentWidget extends StatefulWidget {
  final Map<String, dynamic> comment;

  const CommentWidget({super.key, required this.comment});

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.comment['name'],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 8),
            Text(
              widget.comment['text'],
              maxLines: isExpanded ? null : 1,
              overflow:
                  isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 18),
            ),
            if (!isExpanded)
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
              ),
          ],
        ),
      ),
    );
  }
}
