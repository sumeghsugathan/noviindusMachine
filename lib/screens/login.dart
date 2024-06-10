import 'package:flutter/material.dart';
import 'package:projectnov/components/loginnote.dart';
import 'package:projectnov/components/logocard.dart';
import 'package:projectnov/components/termstext.dart';
import 'package:projectnov/providers/patient_provider.dart';
import 'package:projectnov/screens/register_patient_screen.dart';
import 'package:projectnov/utils/buttons/colorbutton.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Future<void>? _loginFuture;

  Future<void> _login(BuildContext context) async {
    try {
      await Provider.of<PatientProvider>(context, listen: false)
          .login(_usernameController.text, _passwordController.text);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RegisterPatientScreen(),
          ),
        );
      });
    } catch (error) {
      print('Login failed: $error');
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Login Failed'),
            content: Text(error.toString()),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LogoCard(),
            const LoginNote(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Enter your email",
                      labelText: 'Email',
                      filled: true,
                      fillColor: Color.fromARGB(73, 217, 217, 217),
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Enter password",
                      labelText: 'Password',
                      filled: true,
                      fillColor: Color.fromARGB(73, 217, 217, 217),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: MyButton(
                      width: double.infinity,
                      onTap: () {
                        setState(() {
                          _loginFuture = _login(context);
                        });
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  if (_loginFuture != null)
                    FutureBuilder<void>(
                      future: _loginFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Login Failed'),
                                content: Text(snapshot.error.toString()),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          });
                        }
                        return Container();
                      },
                    ),
                ],
              ),
            ),
            const TermsText(),
          ],
        ),
      ),
    );
  }
}
