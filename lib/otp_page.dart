// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'home_page.dart';
//
// class OTPPage extends StatefulWidget {
//   final String verificationId;
//   final String phoneNumber;
//
//   OTPPage(this.verificationId, this.phoneNumber);
//
//   @override
//   _OTPPageState createState() => _OTPPageState();
// }
//
// class _OTPPageState extends State<OTPPage> {
//   final _otpController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   bool _loading = false;
//
//   void _validateAndSubmit() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _loading = true;
//       });
//
//       String smsCode = _otpController.text.trim();
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: widget.verificationId,
//         smsCode: smsCode,
//       );
//
//       try {
//         await FirebaseAuth.instance.signInWithCredential(credential);
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => HomePage(),
//           ),
//         );
//       } on FirebaseAuthException catch (e) {
//         print('Error: ${e.message}');
//       }
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
//       appBar: AppBar(title: Text('OTP Verification')),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextFormField(
//                   controller: _otpController,
//                   keyboardType: TextInputType.number,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the OTP';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     labelText: 'OTP',
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: _loading ? null : _validateAndSubmit,
//                   child: _loading ? CircularProgressIndicator() : Text('Verify'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:phone_num_otp_auth/home_page.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// class OTPPage extends StatefulWidget {
//   final String verificationId;
//   final String phoneNumber;
//
//   OTPPage(this.verificationId, this.phoneNumber);
//
//   @override
//   _OTPPageState createState() => _OTPPageState();
// }
//
// class _OTPPageState extends State<OTPPage> {
//   final _otpController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   bool _loading = false;
//
//   void _validateAndSubmit() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _loading = true;
//       });
//
//       String smsCode = _otpController.text.trim();
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: widget.verificationId,
//         smsCode: smsCode,
//       );
//
//       try {
//         await FirebaseAuth.instance.signInWithCredential(credential);
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => HomePage(),
//           ),
//         );
//       } on FirebaseAuthException catch (e) {
//         print('Error: ${e.message}');
//         Fluttertoast.showToast(
//           msg: 'Invalid OTP. Please try again.',
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//         );
//       }
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
//       appBar: AppBar(title: Text('OTP Verification')),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextFormField(
//                   controller: _otpController,
//                   keyboardType: TextInputType.number,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the OTP';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     labelText: 'OTP',
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: _loading ? null : _validateAndSubmit,
//                   child: _loading
//                       ? CircularProgressIndicator()
//                       : Text(
//                     'Verify',
//                     style: TextStyle(fontSize: 20.0),
//                   ),
//                   style: ButtonStyle(
//                     minimumSize: MaterialStateProperty.all<Size>(Size(150, 50)),
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


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:phone_num_otp_auth/home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPPage extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;

  OTPPage(this.verificationId, this.phoneNumber);

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  TextEditingController _otpController = TextEditingController();
  bool _loading = false;

  void _validateAndSubmit() async {
    setState(() {
      _loading = true;
    });

    String smsCode = _otpController.text.trim();
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: smsCode,
    );

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );

      Fluttertoast.showToast(
        msg: 'OTP successfully verified',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } on FirebaseAuthException catch (e) {
      print('Error: ${e.message}');
      Fluttertoast.showToast(
        msg: 'Invalid OTP. Please try again.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OTP Verification')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PinCodeTextField(
                appContext: context,
                controller: _otpController,
                length: 6,
                onChanged: (value) {
                  // Handle pin code change
                },
                onCompleted: (value) {
                  // Handle pin code complete
                },
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.transparent,
                  inactiveFillColor: Colors.transparent,
                  selectedFillColor: Colors.transparent,
                  activeColor: Colors.blue,
                  inactiveColor: Colors.grey,
                  selectedColor: Colors.blue,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _loading ? null : _validateAndSubmit,
                child: _loading
                    ? CircularProgressIndicator()
                    : Text(
                  'Verify',
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
    );
  }
}
