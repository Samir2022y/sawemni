import 'package:flutter/material.dart';
import '/themes/colors.dart'; 
import 'login.dart';
import 'landing.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  
  bool _showValidationErrors = false;

  void _submit() {
    final valid = _formKey.currentState!.validate();
    if (valid) {
      _formKey.currentState!.save();
      // Navigate to home or handle successful signup
    } else {
      setState(() {
        _showValidationErrors = true;
      });
    }
  }

  String? _validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      return 'يرجى إدخال اسم المستخدم';
    } else if (username.length < 6) {
      return 'يجب أن يكون اسم المستخدم على الأقل 6 أحرف';
    }
    return null;
  }

  String? _validatePhone(String? phone) {
    if (phone == null || phone.isEmpty) {
      return 'يرجى إدخال رقم الهاتف';
    } else if (!RegExp(r'^0(5|6|7)\d{8}$').hasMatch(phone)) {
      return 'رقم هاتف غير صالح';
    }
    return null;
  }

  String? _validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'يرجى إدخال كلمة المرور';
    } else if (password.length < 8) {
      return 'يجب أن تكون كلمة المرور على الأقل 8 أحرف';
    }
    return null;
  }

  String? _validateConfirmPassword(String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'يرجى إدخال تأكيد كلمة المرور';
    } else if (confirmPassword != _passwordController.text) {
      return 'تأكيد كلمة المرور غير متطابق';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Directionality(textDirection: TextDirection.rtl,
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 30, 0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: primaryColor,
              size: screenWidth * 0.08,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(50, 5, 50, 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 40),
               Center(
                child: Text(
                  'حساب جديد',
                  style: TextStyle(
                    fontSize: screenWidth * 0.08,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'يرجى تعبئة المعلومات التالية',
                  style: TextStyle(
                    color: Color.fromARGB(171, 0, 0, 0),
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: 'اسم المستخدم',
                  hintStyle: TextStyle(
                        color: informationText, // Change to your desired color
                        fontSize: 20,
                      ),
                  prefixIcon: Icon(Icons.person,
                          color:
                              informationText), // Change to your desired color),
                  filled: true,
                  fillColor: (_usernameController.text.isEmpty ||
                              _validateUsername(_usernameController.text) !=
                                  null) && _showValidationErrors == true
                          ? Colors.red.shade100
                          : informationColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  errorStyle: TextStyle(
                        fontSize: 18,
                      ), 
                ),
                style: TextStyle(
                fontSize: 20),
                validator: _validateUsername,
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  hintText: 'رقم الهاتف',
                  hintStyle: TextStyle(
                        color: informationText, // Change to your desired color
                        fontSize: 20,
                      ),
                  prefixIcon: Icon(Icons.phone, 
                  color: informationText,),
                  filled: true,
                  fillColor: (_phoneController.text.isEmpty ||
                              _validatePhone(_phoneController.text) !=
                                  null )&&
                                  _showValidationErrors == true
                          ? Colors.red.shade100
                          : informationColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  errorStyle: TextStyle(
                        fontSize: 18,
                      ), 
                ),
                                style: TextStyle(fontSize: 20),
                keyboardType: TextInputType.phone,
                validator: _validatePhone,
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'كلمة المرور',
                  hintStyle: TextStyle(
                        color: informationText, // Change to your desired color
                        fontSize: 20,
                      ),
                  prefixIcon: Icon(Icons.lock,
                  color: informationText),// Change to your desired color),
                  filled: true,
                  fillColor: (_passwordController.text.isEmpty ||
                              _validatePassword(_passwordController.text) !=
                                  null) && _showValidationErrors == true
                              ? Colors.red.shade100
                              : informationColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  errorStyle: TextStyle(
                        fontSize: 18,
                      ), 
                ),
                style: TextStyle(fontSize: 20),
                obscureText: true,
                validator: _validatePassword,
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  hintText: 'تأكيد كلمة المرور',
                  hintStyle: TextStyle(
                        color: informationText, // Change to your desired color
                        fontSize: 20,
                      ),
                  prefixIcon: Icon(Icons.lock,
                  color: informationText ),// Change to your desired color),
                  filled: true,
                  fillColor: (_confirmPasswordController.text.isEmpty ||
                              _validateConfirmPassword(_confirmPasswordController.text) !=
                                  null) &&
                                  _showValidationErrors == true
                          ? Colors.red.shade100
                          : informationColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                    errorStyle: TextStyle(
                    fontSize: 18, 
                    ),  
                ),
                                style: TextStyle(fontSize: 20),
                obscureText: true,
                validator: _validateConfirmPassword,
              ),
              const SizedBox(height: 40),

              Center(
                child: Card(
                  color: signColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _submit();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Homescreen()),
                        );
                      } else {
                        setState(() {
                          _showValidationErrors = true;
                        });
                      }
                    },
                    child: SizedBox(
                      width: screenWidth * 0.7,
                      height: 70,
                      child: Center(
                        child: Text(
                          'انشئ حساب',
                          style: TextStyle(
                            fontSize: screenWidth * 0.06,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Login Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    'لديك حساب؟',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: screenWidth * 0.045,
                    ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: screenWidth * 0.045,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),)
    );
  }
}
