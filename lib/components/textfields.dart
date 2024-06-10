// import 'package:flutter/material.dart';
// import 'package:projectnov/providers/patient_provider.dart';
// import 'package:projectnov/utils/buttons/colorbutton.dart';
// import 'package:provider/provider.dart';

// class Textfields extends StatelessWidget {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   Textfields({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         children: [
//           TextField(
//             controller: _usernameController,
//             decoration: const InputDecoration(
//               border: OutlineInputBorder(borderSide: BorderSide.none),
//               hintText: "Enter your email",
//               labelText: 'Email',
//               filled: true,
//               fillColor: Color.fromARGB(73, 217, 217, 217),
//             ),
//           ),
//           const SizedBox(
//             height: 40,
//           ),
//           TextField(
//             controller: _passwordController,
//             decoration: const InputDecoration(
//               border: OutlineInputBorder(borderSide: BorderSide.none),
//               hintText: "Enter password",
//               labelText: 'Password',
//               filled: true,
//               fillColor: Color.fromARGB(73, 217, 217, 217),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: MyButton(
//               width: double.infinity,
//               onTap: () async {
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
//               },
//               child: const Text(
//                 "Login",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.w600),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
