import 'package:flutter/material.dart';
import '../services/api_service.dart';

class PatientProvider with ChangeNotifier {
  final ApiService apiService;
  String _token = '';
  List<dynamic> _branches = [];
  List<dynamic> _treatments = [];
  bool _isLoading = false;

  PatientProvider({required this.apiService});

  String get token => _token;
  List<dynamic> get branches => _branches;
  List<dynamic> get treatments => _treatments;
  bool get isLoading => _isLoading;

  Future<void> login(String username, String password) async {
    try {
      _isLoading = true;
      notifyListeners();
      _token = await apiService.login(username, password);
    } catch (error) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchBranches() async {
    if (_token.isEmpty) return;

    try {
      _isLoading = true;
      _branches = await apiService.fetchBranches(_token);
    } catch (error) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchTreatments() async {
    if (_token.isEmpty) return;

    try {
      _isLoading = true;
      _treatments = await apiService.fetchTreatments(_token);
    } catch (error) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> registerPatient(Map<String, dynamic> patientData) async {
    if (_token.isEmpty) return;
    try {
      _isLoading = true;
      notifyListeners();

      // Convert numeric fields to strings
      patientData['total_amount'] = patientData['total_amount'].toString();
      patientData['discount_amount'] =
          patientData['discount_amount'].toString();
      patientData['advance_amount'] = patientData['advance_amount'].toString();
      patientData['balance_amount'] = patientData['balance_amount'].toString();

      // Ensure the ID is set to an empty string if not provided
      patientData['id'] = patientData['id'] ?? '';

      // Convert lists to comma-separated strings only if they are lists
      if (patientData['male'] is List) {
        patientData['male'] = (patientData['male'] as List).join(',');
      }
      if (patientData['female'] is List) {
        patientData['female'] = (patientData['female'] as List).join(',');
      }
      if (patientData['treatments'] is List) {
        patientData['treatments'] =
            (patientData['treatments'] as List).join(',');
      }

      await apiService.registerPatient(patientData, _token);
      notifyListeners();
    } catch (error) {
      print('Registration failed: $error');
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
