import 'package:flutter/material.dart';
import 'package:sawemni/themes/colors.dart';
import 'package:sawemni/themes/styles.dart';
import 'package:image_input/image_input.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../main.dart';

class Addproduct extends StatefulWidget {
  const Addproduct({super.key});

  @override
  State<Addproduct> createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {
  OverlayEntry? entry;
  List<XFile> imageInputImages = [];
    bool allowEditImageInput = true;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<bool>? add;


  void showOverlay(Future<bool>? add) {
    entry = OverlayEntry(
        builder: (context) => Positioned(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: buildOverlay(add)));
    final overlay = Overlay.of(context);
    overlay.insert(entry!);
  }

  @override
  void dispose() {
    entry?.remove();
    super.dispose();
  }

  Widget buildOverlay(Future<bool>? add) => Stack(
        children: [
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: Container(),
            ),
          ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.width * 0.5,
              width: MediaQuery.of(context).size.height * 0.7,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 15,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: FutureBuilder<bool>(
                future: add,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.orange,
                    ));
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (snapshot.hasData && snapshot.data!) {
                    return Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'تم تحميل المنتج',
                          style: addProductStyle,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              entry?.remove();  
                              entry = null;
                              resetForm();
                            },
                            style: butttonDecoration,
                            child: const Text('حسنا'))
                      ],
                    ));
                  } else {
                    return const Center(
                        child: Text('حصل خطا أثناء تحميل المنتج'));
                  }
                },
              ),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'اضافة منتج',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        )),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'يرجى توفير كل المعلومات الضرورية الخاصة بالمنتج لانتاج لائحة لافتة وجذب اكبر عدد من المشترين ',
                      textAlign: TextAlign.center,
                      style: addProductStyle,
                    ),
                  ),
                  Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              text: const TextSpan(children: [
                            TextSpan(
                              text: 'اسم المنتج ',
                              style: addProductStyle,
                            ),
                            TextSpan(
                                text: ' * ',
                                style: TextStyle(color: Colors.red))
                          ])),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: TextFormField(
                                onSaved: (value) {
                                  ProductName = value!;
                                },
                                validator: validateRequired,
                                decoration: myInputDecoration(
                                    'اكتب اسم المنتج هنا ....', Icons.store)),
                          ),
                          RichText(
                              text: const TextSpan(children: [
                            TextSpan(
                              text: 'البريد الالكتروني ',
                              style: addProductStyle,
                            ),
                            TextSpan(
                                text: ' * ',
                                style: TextStyle(color: Colors.red))
                          ])),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 15.0,
                            ),
                            child: TextFormField(
                                onSaved: (value) {
                                  email = value!;
                                },
                                validator: validateRequired,
                                decoration: myInputDecoration(
                                    'example@test.com', Icons.email)),
                          ),
                          const Text(
                            'رقم الهاتف',
                            style: addProductStyle,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 15.0,
                            ),
                            child: TextFormField(
                                onSaved: (value) {
                                  phoneNumber = value!;
                                },
                                decoration: myInputDecoration(
                                    'xxxx-xxxx-xx', Icons.phone)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 15),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                          text: const TextSpan(children: [
                                        TextSpan(
                                          text: 'الولاية',
                                          style: addProductStyle,
                                        ),
                                        TextSpan(
                                            text: ' * ',
                                            style: TextStyle(color: Colors.red))
                                      ])),
                                      TextFormField(
                                          onSaved: (value) {
                                            wilaya = value!;
                                          },
                                          decoration: myInputDecoration(
                                              'اكتب هنا ...',
                                              Icons.location_city_rounded)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                          text: const TextSpan(children: [
                                        TextSpan(
                                          text: 'البلدية',
                                          style: addProductStyle,
                                        ),
                                        TextSpan(
                                            text: ' * ',
                                            style: TextStyle(color: Colors.red))
                                      ])),
                                      TextFormField(
                                          onSaved: (value) {
                                            state = value!;
                                          },
                                          decoration: myInputDecoration(
                                              'اكتب هنا ...',
                                              Icons.location_city_rounded)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          RichText(
                              text: const TextSpan(children: [
                            TextSpan(
                              text: 'اسم الشارع',
                              style: addProductStyle,
                            ),
                            TextSpan(
                                text: ' * ',
                                style: TextStyle(color: Colors.red))
                          ])),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 15.0,
                            ),
                            child: TextFormField(
                                onSaved: (value) {
                                  adress = value!;
                                },
                                validator: validateRequired,
                                decoration: myInputDecoration(
                                    'اكتب اسم الشارع هنا ...',
                                    Icons.location_city_rounded)),
                          ),
                          RichText(
                              text: const TextSpan(children: [
                            TextSpan(
                              text: 'الحالة',
                              style: addProductStyle,
                            ),
                            TextSpan(
                                text: ' * ',
                                style: TextStyle(color: Colors.red))
                          ])),
                          DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.orange, width: 3.0),
                              ),
                              hintText:
                                  'حالة المنتج', // Use the passed hintText
                              prefixIcon: Icon(
                                Icons.store,
                                color: Colors.black,
                              ),
                            ),
                            value: selectedState,
                            items: states
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Center(child: Text(item)),
                                    ))
                                .toList(),
                            onChanged: (newValue) =>
                                handleChange(newValue, "dropdown1"),
                          ),
                          RichText(
                              text: const TextSpan(children: [
                            TextSpan(
                              text: 'الفئة',
                              style: addProductStyle,
                            ),
                            TextSpan(
                                text: ' * ',
                                style: TextStyle(color: Colors.red))
                          ])),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.orange, width: 3.0),
                                ),

                                hintText:
                                    'تصنيف المنتج', // Use the passed hintText
                                prefixIcon: Icon(
                                  Icons.store,
                                  color: Colors.black,
                                ),
                              ),
                              value: selctedCategory,
                              items: categories
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Center(
                                            child: Text(
                                          item,
                                        )),
                                      ))
                                  .toList(),
                              onChanged: (newValue) =>
                                  handleChange(newValue, "dropdown2"),
                            ),
                          ),
                          RichText(
                              text: const TextSpan(children: [
                            TextSpan(
                              text: 'السعر الأدنى',
                              style: addProductStyle,
                            ),
                            TextSpan(
                                text: ' * ',
                                style: TextStyle(color: Colors.red))
                          ])),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 15.0,
                            ),
                            child: TextFormField(
                                onSaved: (value) {
                                  price = double.parse(value!);
                                },
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: true), // Numeric input

                                validator: validateRequired,
                                decoration: myInputDecoration(
                                    'ادخل السعر الأدنى هنا ...',
                                    Icons.location_city_rounded)),
                          ),
                          const Text(
                            'وصف المنتج ',
                            style: addProductStyle,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextField(
                            controller: _controller,

                            decoration: const InputDecoration(
                                hintText: 'يمكنك اضافة وصف للمنتج هنا ...',
                                border:
                                    OutlineInputBorder(), // Optional: Adds border to the field
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.orange, width: 2.0),
                                )),
                            keyboardType: TextInputType.multiline,
                            maxLines:
                                8, // You can adjust this to control how many lines the field can grow
                            minLines:
                                4, // This will make the field start with 4 lines of input
                            textInputAction: TextInputAction
                                .newline, // Allows entering new lines
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'صور المنتج ',
                            style: addProductStyle,
                          ),
                          Center(
                            child: ImageInput(
                              images: imageInputImages,
                              allowEdit: allowEditImageInput,
                              allowMaxImage: 5,
                              getPreferredCameraDevice: () async =>
                                  await getPrefferedCameraDevice(context),
                              getImageSource: () async =>
                                  await getImageSource(context),
                              onImageSelected: (image) {
                                setState(() {
                                  imageInputImages.add(image);
                                });
                              },
                              onImageRemoved: (image, index) {
                                setState(() {
                                  imageInputImages.remove(image);
                                });
                              },
                              loadingBuilder: (context, progress) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: SizedBox(
                              width: 300,
                              child: ElevatedButton(
                                onPressed: () {
                                 if (formKey.currentState!.validate()) {

                                  Description = _controller.text;
                                  add = saveProductInfo.saveProductInfo();
                                  showOverlay(add);

                                  
                                  }
                                },
                                style: butttonDecoration,
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.add_box_outlined,
                                            color: Colors.white),
                                        SizedBox(width: 8),
                                        Text('أضف المنتج',
                                            style: TextStyle(fontSize: 15)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
void resetForm() {
  formKey.currentState?.reset();
  setState(() {
  imageInputImages = [];
   selectedState = null;
   selctedCategory = null;
   ProductName = '';
   email = '';
   phoneNumber = '';
   wilaya = '';
   state = '';
   adress = '';
   price = 0;
   Description = '';
  });
}
  String? selectedState ;
  String? selctedCategory ;
  String ProductName = '';
  String email = '';
  String phoneNumber = '';
  String wilaya = '';
  String state = '';
  String adress = '';
  double price = 0;
  String Description = '';
  final List<String> states = [
    'جديد',
    'مستعمل',
    ' مستعمل بحالة جيدة',
    'غير صالح'
  ];
  final List<String> categories = [
    'الأثاث',
    'الأجهزة المنزلية',
    'الإلكترونيات',
    'ديكور المنزل',
    ' السيارات وقطع الغيار',
    'أدوات البناء والصيانة'
  ];
  final TextEditingController _controller = TextEditingController();

  void handleChange(String? newValue, String? dropdownId) {
    setState(() {
      if (dropdownId == "dropdown1") {
        selectedState = newValue;
      } else if (dropdownId == "dropdown2") {
        selctedCategory = newValue;
      }
    });
  }

  String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى ملئ هذا الحقل';
    }
    return null;
  }

  var getImageSource = (BuildContext context) {
    return showDialog<ImageSource>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            SimpleDialogOption(
              child: const Center(child: Text("كاميرا")),
              onPressed: () {
                Navigator.of(context).pop(ImageSource.camera);
              },
            ),
            SimpleDialogOption(
                child: const Center(child: Text("معرض الصور")),
                onPressed: () {
                  Navigator.of(context).pop(ImageSource.gallery);
                }),
          ],
        );
      },
    ).then((value) {
      return value ?? ImageSource.gallery;
    });
  };

  var getPrefferedCameraDevice = (BuildContext context) async {
    var status = await Permission.camera.request();
    if (status.isDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Allow Camera Permission"),
        ),
      );
      return null;
    }
  };
}
