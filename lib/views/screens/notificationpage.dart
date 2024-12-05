import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import 'detailedProduct.dart';

class Notificationpage extends StatefulWidget {


  Notificationpage({super.key});

  @override
  State<Notificationpage> createState() => _NotificationpageState();
}

class _NotificationpageState extends State<Notificationpage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            elevation: 2.0,
            shadowColor: Colors.grey,
            bottom: const TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.black,
                unselectedLabelStyle: TextStyle(color: Colors.grey),
                isScrollable: true,
                indicatorColor: Colors.orange,
                tabs: [
                  Tab(text: 'الكل'),
                  Tab(text: 'عروض مقبولة'),
                  Tab(text: 'مزايدات'),
                  Tab(text: 'طلبات'),
                ]),
            title: const Text('اشعارات'),
            centerTitle: true,
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Detailedproduct(),
                                   
                                  ),
                            );
                          },
                          child: acceptedOffer(
                              ' خزانة ملابس', 'mohamed el amine', 4000)),
                      acceptedOffer('ماكينة خياطة', 'abderrahim', 5000),
                      bidOffer(' خزانة ملابس', 'mohamed el amine', 4000),
                      offer(' خزانة ملابس', 'mohamed el amine', 4000),
                      bidOffer(' خزانة ملابس', 'mohamed el amine', 4000),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      acceptedOffer(' خزانة ملابس', 'mohamed el amine', 4000),
                      acceptedOffer('ماكينة خياطة', 'abderrahim', 5000),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      bidOffer(' خزانة ملابس', 'mohamed el amine', 4000),
                      bidOffer(' خزانة ملابس', 'mohamed el amine', 4000),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      offer(' خزانة ملابس', 'mohamed el amine', 4000),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
