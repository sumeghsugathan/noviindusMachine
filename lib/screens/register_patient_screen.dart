import 'package:flutter/material.dart';
import 'package:projectnov/utils/components/patientform.dart';
import 'package:provider/provider.dart';
import '../providers/patient_provider.dart';

class RegisterPatientScreen extends StatefulWidget {
  const RegisterPatientScreen({super.key});

  @override
  RegisterPatientScreenState createState() => RegisterPatientScreenState();
}

class RegisterPatientScreenState extends State<RegisterPatientScreen> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<PatientProvider>(context, listen: false);
    provider.fetchBranches();
    provider.fetchTreatments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Icon(
                  Icons.notifications_none_outlined,
                  size: 25,
                ),
                Positioned(
                  right: 3,
                  top: 1,
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: Colors.red,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: Consumer<PatientProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 34.0),
                  child: Text(
                    "Register Patient",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 24),
                  ),
                ),
                Divider(),
                PatientForm(),
              ],
            ),
          );
        },
      ),
    );
  }
}
