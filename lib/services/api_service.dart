import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'https://flutter-amr.noviindus.in/api/';

  Future<String> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('${baseUrl}Login'),
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['token'];
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<List<dynamic>> fetchPatients(String token) async {
    final response = await http.get(
      Uri.parse('${baseUrl}PatientList'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['patients'];
    } else {
      throw Exception('Failed to load patients');
    }
  }

  Future<List<dynamic>> fetchBranches(String token) async {
    final response = await http.get(
      Uri.parse('${baseUrl}BranchList'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['branches'];
    } else {
      throw Exception('Failed to load branches: ${response.body}');
    }
  }

  Future<List<dynamic>> fetchTreatments(String token) async {
    final response = await http.get(
      Uri.parse('${baseUrl}TreatmentList'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['treatments'];
    } else {
      throw Exception('Failed to load treatments: ${response.body}');
    }
  }

  Future<void> registerPatient(
      Map<String, dynamic> patientData, String token) async {
    const url = '${baseUrl}PatientUpdate';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode(patientData),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      // Successfully registered patient
      print('Patient registered successfully');
    } else {
      // Handle error response
      final responseBody = response.body;
      print('Failed to register patient: $responseBody');
      throw Exception('Failed to register patient: $responseBody');
    }
  }
}
