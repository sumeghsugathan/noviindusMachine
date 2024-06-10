import 'package:flutter/material.dart';
import 'package:projectnov/providers/patient_provider.dart';
import 'package:projectnov/utils/buttons/colorbutton.dart';
import 'package:projectnov/utils/components/PdfGenerator.dart';
import 'package:projectnov/utils/textfields/custom_text_field.dart';
import 'package:provider/provider.dart';

class PatientForm extends StatefulWidget {
  const PatientForm({super.key});

  @override
  PatientFormState createState() => PatientFormState();
}

class PatientFormState extends State<PatientForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _executiveController = TextEditingController();
  final TextEditingController _paymentController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _totalAmountController = TextEditingController();
  final TextEditingController _discountAmountController =
      TextEditingController();
  final TextEditingController _advanceAmountController =
      TextEditingController();
  final TextEditingController _balanceAmountController =
      TextEditingController();
  final TextEditingController _dateTimeController = TextEditingController();

  String? selectedBranch;
  List<String> selectedTreatments = [];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PatientProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CustomTextField(
            controller: _nameController,
            labelText: 'Name',
            hintText: "Enter your Name",
          ),
          CustomTextField(
            controller: _executiveController,
            labelText: 'Executive',
            hintText: "Enter your Executive",
          ),
          CustomTextField(
            controller: _paymentController,
            labelText: 'Payment',
            hintText: "Payment Method",
          ),
          CustomTextField(
            controller: _phoneController,
            labelText: 'Phone',
            hintText: "Enter your Phone",
          ),
          CustomTextField(
            controller: _addressController,
            labelText: 'Address',
            hintText: "Enter your Address",
          ),
          CustomTextField(
            controller: _totalAmountController,
            labelText: 'Total Amount',
            hintText: "Enter Total Amount",
            keyboardType: TextInputType.number,
          ),
          CustomTextField(
            controller: _discountAmountController,
            labelText: 'Discount Amount',
            hintText: "Your Discount",
            keyboardType: TextInputType.number,
          ),
          CustomTextField(
            controller: _advanceAmountController,
            labelText: 'Advance Amount',
            hintText: "Advance Amount",
            keyboardType: TextInputType.number,
          ),
          CustomTextField(
            controller: _balanceAmountController,
            labelText: 'Balance Amount',
            hintText: "Your Balance",
            keyboardType: TextInputType.number,
          ),
          CustomTextField(
            controller: _dateTimeController,
            labelText: 'Date and Time',
            hintText: "Date and Time ",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButton<String>(
              isExpanded: true,
              value: selectedBranch,
              hint: const Text('Select Branch'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedBranch = newValue;
                });
              },
              items: provider.branches
                  .map<DropdownMenuItem<String>>((dynamic branch) {
                return DropdownMenuItem<String>(
                  value: branch['id'].toString(),
                  child: Text(branch['name']),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButton<String>(
              isExpanded: true,
              value: null,
              hint: const Text('Select Treatments'),
              onChanged: (String? newValue) {
                if (newValue != null &&
                    !selectedTreatments.contains(newValue)) {
                  setState(() {
                    selectedTreatments.add(newValue);
                  });
                }
              },
              items: provider.treatments
                  .map<DropdownMenuItem<String>>((dynamic treatment) {
                return DropdownMenuItem<String>(
                  value: treatment['id'].toString(),
                  child: Text(treatment['name']),
                );
              }).toList(),
            ),
          ),
          Wrap(
            children: selectedTreatments.map((treatmentId) {
              final treatment = provider.treatments.firstWhere(
                  (element) => element['id'].toString() == treatmentId);
              return Chip(
                label: Text(treatment['name']),
                onDeleted: () {
                  setState(() {
                    selectedTreatments.remove(treatmentId);
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          MyButton(
            width: double.infinity,
            onTap: () async {
              try {
                Map<String, dynamic> patientData = {
                  'name': _nameController.text,
                  'excecutive': _executiveController.text,
                  'payment': _paymentController.text,
                  'phone': _phoneController.text,
                  'address': _addressController.text,
                  'total_amount':
                      double.tryParse(_totalAmountController.text) ?? 0.0,
                  'discount_amount':
                      double.tryParse(_discountAmountController.text) ?? 0.0,
                  'advance_amount':
                      double.tryParse(_advanceAmountController.text) ?? 0.0,
                  'balance_amount':
                      double.tryParse(_balanceAmountController.text) ?? 0.0,
                  'date_nd_time': _dateTimeController.text,
                  'branch': selectedBranch ?? '',
                  'treatments': selectedTreatments.join(','),
                };

                await provider.registerPatient(patientData);

                PdfGenerator().generatePdf(patientData);
              } catch (error) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Registration Failed'),
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
              }
            },
            child: const Text(
              'Register',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
