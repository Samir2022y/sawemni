import 'package:flutter/material.dart';
import '/themes/colors.dart';
import '../widgets/widgets.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameOrPhoneController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
        bool _showValidationErrors = false;


  bool usernameExists(String value) {
    return value.isNotEmpty; 
  }

  String? _validateUsernameOrPhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال اسم المستخدم أو رقم الهاتف';
    }
    if (!usernameExists(value)) {
      return 'اسم المستخدم أو رقم الهاتف غير موجود';
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

  void _resetPassword() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('تم تغيير كلمة المرور بنجاح!',
        style: TextStyle(fontSize: 18),),
      ));
    }
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 16, 50, 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'إعادة تعيين كلمة المرور',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 70),
                Text(
                  'هنا يمكنك استرجاع كلمة المرور باستخدام رقم الهاتف أو اسم المستخدم',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 70),

                // Username or Phone input
                TextFormField(
                  controller: _usernameOrPhoneController,
                  decoration: InputDecoration(
                    hintText: 'اسم المستخدم أو رقم الهاتف',
                    prefixIcon: Icon(Icons.person, color: informationText),
                    fillColor: ((_usernameOrPhoneController.text.isEmpty ||
                                    _validateUsernameOrPhone(
                                            _passwordController.text) !=
                                        null ) && _showValidationErrors
)
                            ? Colors.red.shade100
                            : informationColor,
                    border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(20), // For rounded corners
                        ),
                        errorStyle: TextStyle(
                          fontSize: 18, // Set desired font size for error message
                        ),
                  ),
                  validator: _validateUsernameOrPhone,
                ),
                SizedBox(height: 20),

                // New Password input
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: 'كلمة المرور الجديدة',
                    prefixIcon: Icon(Icons.lock, color: informationText),
                    fillColor: (_passwordController.text.isEmpty ||
                                    _validatePassword(
                                            _passwordController.text) !=
                                        null) && _showValidationErrors
                            ? Colors.red.shade100
                            : informationColor,
                    border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(20), // For rounded corners
                        ),
                        errorStyle: TextStyle(
                          fontSize:
                              18, // Set desired font size for error message
                        ),
                  ),
                  obscureText: true,
                  validator: _validatePassword,
                ),
                SizedBox(height: 20),

                // Confirm Password input
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    hintText: 'تأكيد كلمة المرور',
                    prefixIcon: Icon(Icons.lock, color: informationText),
                    fillColor: (_confirmPasswordController.text.isEmpty ||
                                    _validatePassword(
                                            _confirmPasswordController.text) !=
                                        null) && _showValidationErrors
                            ? Colors.red.shade100
                            : informationColor,
                    border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(20), // For rounded corners
                        ),
                        errorStyle: TextStyle(
                          fontSize:
                              18, // Set desired font size for error message
                        ),
                  ),
                  obscureText: true,
                  validator: _validateConfirmPassword,
                ),
                SizedBox(height: 40),

                // Reset Password Button
                ElevatedButton(
                  onPressed: _resetPassword,
                  child: Text('إعادة تعيين كلمة المرور',
                  style: TextStyle(color: Colors.white, 
                  fontSize: 25)),
                  style: ElevatedButton.styleFrom(
                  minimumSize: Size(350, 60),
                  shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30), 
                        ),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),)
    );
  }
}
