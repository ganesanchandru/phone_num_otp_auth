// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'otp_page.dart';
//
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final _phoneNumberController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   bool _loading = false;
//   bool _isPhoneNumberValid = false;
//
//   void _validateAndSubmit() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _loading = true;
//       });
//
//       String phoneNumber = '+91' + _phoneNumberController.text.trim();
//       await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: phoneNumber,
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           await FirebaseAuth.instance.signInWithCredential(credential);
//         },
//         verificationFailed: (FirebaseAuthException e) {
//           print('Error: ${e.message}');
//         },
//         codeSent: (String verificationId, int? resendToken) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => OTPPage(verificationId, phoneNumber),
//             ),
//           );
//         },
//         codeAutoRetrievalTimeout: (String verificationId) {},
//       );
//
//       setState(() {
//         _loading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Phone Number Login')),
//       body: Center(
//         child:
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextFormField(
//                   autofocus: true,
//                   maxLength: 10,
//                   controller: _phoneNumberController,
//                   keyboardType: TextInputType.phone,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your phone number';
//                     }else if(value.length<10){
//                       return 'Please enter your 10 digit phone number';
//                     }
//                     // else if(!value.startsWith('6 || 7 || 8 || 9')) {
//                     //   return 'Invalid Error';
//                     // }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                       borderSide: BorderSide(color: Colors.grey),
//                     ),
//                     labelText: 'Phone Number',
//                     labelStyle: TextStyle(color: Colors.grey.shade700),
//                     prefixText: '+91',
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20.0),
//                         borderSide: BorderSide(color: Colors.grey,
//                         )
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                       borderSide: BorderSide(color: Colors.grey,
//                       ),
//                   ),
//                     errorBorder: OutlineInputBorder(
//                       borderRadius:BorderRadius.circular(20.0),
//                       borderSide: const BorderSide(color: Colors.redAccent),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: _loading ? null : _validateAndSubmit,
//                   child: _loading ? CircularProgressIndicator() : Text('Login',style: TextStyle(fontSize: 20.0),),
//                   style: ButtonStyle(
//                     minimumSize: MaterialStateProperty.all<Size>(Size(150, 50)),
//
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         // child: SingleChildScrollView(
//         //   child: Padding(
//         //     padding: const EdgeInsets.all(16.0),
//         //     child: Form(
//         //       key: _phoneKey,
//         //       child: Column(
//         //         children: [
//         //           IntlPhoneField(
//         //             controller: _phoneNumberController,
//         //             decoration: const InputDecoration(
//         //               labelText: 'Phone Number',
//         //               prefixIcon: Icon(Icons.phone),
//         //             ),
//         //             initialCountryCode: 'IN',
//         //             onChanged: (phone) {
//         //               setState(() {
//         //                 _isPhoneNumberValid = phone.isValidNumber();
//         //               });
//         //             },
//         //             onSaved: (phone) {
//         //               final completePhoneNumber = phone?.completeNumber;
//         //               final countryCode = phone?.countryCode;
//         //             },
//         //           ),
//         //           SizedBox(height: 20),
//         //           ElevatedButton(
//         //             onPressed: _isPhoneNumberValid
//         //                 ? () {
//         //               if (_phoneKey.currentState!.validate()) {
//         //                 _phoneKey.currentState!.save();
//         //                 Navigator.of(context).push(MaterialPageRoute(
//         //                     builder: (context) =>
//         //                         OTPPage(_phoneNumberController.text)));
//         //               }
//         //             }
//         //                 : null,
//         //             child: Text('Send OTP'),
//         //           ),
//         //         ],
//         //       ),
//         //     ),
//         //   ),
//         // ),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:phone_num_otp_auth/otp_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

  void _validateAndSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _loading = true;
      });

      String phoneNumber = '+91' + _phoneNumberController.text.trim();

      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          print('Error: ${e.message}');
        },
        codeSent: (String verificationId, int? resendToken) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OTPPage(verificationId, phoneNumber),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );

      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Phone Number Login')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IntlPhoneField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    setState(() {
                      _loading = false;
                    });
                  },
                  onCountryChanged: (phone) {
                    setState(() {
                      _loading = false;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _loading ? null : _validateAndSubmit,
                  child: _loading
                      ? CircularProgressIndicator()
                      : Text(
                    'Get OTP',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(Size(150, 50)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
