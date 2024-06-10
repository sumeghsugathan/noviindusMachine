// import 'package:flutter/material.dart';
// import 'package:projectnov/providers/patient_provider.dart';
// import 'package:projectnov/screens/home.dart';
// import 'package:projectnov/utils/buttons/colorbutton.dart';
// import 'package:provider/provider.dart';

// class LoginButton extends StatelessWidget {
//   const LoginButton({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: MyButton(
//         width: double.infinity,
//         onTap:  () async {
//                 try {
//                   await Provider.of<PatientProvider>(context, listen: false)
//                       .login(
//                           _usernameController.text, _passwordController.text);
//                   Navigator.pushReplacementNamed(context, '/home');
//                 } catch (error) {
//                   print('Login failed: $error');
//                   showDialog(
//                     context: context,
//                     builder: (context) => AlertDialog(
//                       title: Text('Login Failed'),
//                       content: Text(error.toString()),
//                       actions: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           child: Text('OK'),
//                         ),
//                       ],
//                     ),
//                   );
//                 }
//               },,
//         child: const Text(
//           "Login",
//           style: TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//               fontFamily: 'Poppins',
//               fontWeight: FontWeight.w600),
//         ),
//       ),
//     );
//   }
// }
