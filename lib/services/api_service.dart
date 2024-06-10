import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'https://flutter-amr.noviindus.in/api/';

  Future<String> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('${baseUrl}Login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['token'];
    } else {
      throw Exception('Failed to login: ${response.body}');
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
    final response = await http.post(
      Uri.parse('${baseUrl}PatientUpdate'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      },
      body: json.encode(patientData),
    );

    if (response.statusCode != 200) {
      String errorMessage;
      try {
        final data = json.decode(response.body);
        errorMessage = data['message'] ?? 'Unknown error occurred';
      } catch (e) {
        errorMessage = 'Failed to register patient: ${response.body}';
      }
      throw Exception('Failed to register patient: $errorMessage');
    }
  }
}
