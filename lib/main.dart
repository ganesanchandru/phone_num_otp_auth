import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'login_page.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Number OTP Authentication',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}



// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'firebase_options.dart';
// import 'home_page.dart';
//
//
//
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(
//        const MyApp(),
//
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//           debugShowCheckedModeBanner: false,
//           home: const LoginPage(),
//         );
//
//   }
// }
//
//
//
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final _phoneNumberController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   bool _loading = false;
//
//   void _validateAndSubmit() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _loading = true;
//       });
//
//       String phoneNumber = '+91${_phoneNumberController.text.trim()}';
//
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
//       appBar: AppBar(title: const Text('Phone Number Login')),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IntlPhoneField(
//                   controller: _phoneNumberController,
//                   decoration: const InputDecoration(
//                     labelText: 'Phone Number',
//                     border: OutlineInputBorder(),
//                   ),
//                   initialCountryCode: 'IN',
//                   onChanged: (phone) {
//                     setState(() {
//                       _loading = false;
//                     });
//                   },
//                   onCountryChanged: (phone) {
//                     setState(() {
//                       _loading = false;
//                     });
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: _loading ? null : _validateAndSubmit,
//                   style: ButtonStyle(
//                     minimumSize:
//                     MaterialStateProperty.all<Size>(const Size(150, 50)),
//                   ),
//                   child: _loading
//                       ? const CircularProgressIndicator()
//                       : const Text(
//                     'Get OTP',
//                     style: TextStyle(fontSize: 20.0),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class OTPPage extends StatefulWidget {
//   final String verificationId;
//   final String phoneNumber;
//
//   const OTPPage(this.verificationId, this.phoneNumber, {super.key});
//
//   @override
//   _OTPPageState createState() => _OTPPageState();
// }
//
// class _OTPPageState extends State<OTPPage> {
//   final TextEditingController _otpController = TextEditingController();
//   bool _loading = false;
//
//   void _validateAndSubmit() async {
//     setState(() {
//       _loading = true;
//     });
//
//     String smsCode = _otpController.text.trim();
//     PhoneAuthCredential credential = PhoneAuthProvider.credential(
//       verificationId: widget.verificationId,
//       smsCode: smsCode,
//     );
//
//     try {
//       await FirebaseAuth.instance.signInWithCredential(credential);
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) =>  HomePage(),
//         ),
//       );
//
//       Fluttertoast.showToast(
//         msg: 'OTP successfully verified',
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//       );
//     } on FirebaseAuthException catch (e) {
//       print('Error: ${e.message}');
//       Fluttertoast.showToast(
//         msg: 'Invalid OTP. Please try again.',
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//       );
//     }
//
//     setState(() {
//       _loading = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('OTP Verification')),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               PinCodeTextField(
//                 appContext: context,
//                 controller: _otpController,
//                 length: 6,
//                 onChanged: (value) {
//                   // Handle pin code change
//                 },
//                 onCompleted: (value) {
//                   // Handle pin code complete
//                 },
//                 keyboardType: TextInputType.number,
//                 pinTheme: PinTheme(
//                   shape: PinCodeFieldShape.underline,
//                   fieldHeight: 50,
//                   fieldWidth: 40,
//                   activeFillColor: Colors.transparent,
//                   inactiveFillColor: Colors.transparent,
//                   selectedFillColor: Colors.transparent,
//                   activeColor: Colors.blue,
//                   inactiveColor: Colors.grey,
//                   selectedColor: Colors.blue,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _loading ? null : _validateAndSubmit,
//                 style: ButtonStyle(
//                   minimumSize:
//                   MaterialStateProperty.all<Size>(const Size(150, 50)),
//                 ),
//                 child: _loading
//                     ? const CircularProgressIndicator()
//                     : const Text(
//                   'Verify',
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }