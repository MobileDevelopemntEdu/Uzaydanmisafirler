import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uzaydan_misafirler/models/Hospitalmodel.dart';

class HospitalService{
  Future<HospitalModel?> fetchData() async {
    // Replace 'YOUR_API_KEY' with your actual API key
    final apiKey = 'Pl1a64c88DJl7WmYQijyFQtRc3kLoYXV8PEszGA4CxHJoarcXTjd6Fk6vmp5';

    final url = 'https://www.nosyapi.com/apiv2/hospital';

    // Include the API key in the headers
    final headers = {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json', // Adjust content type if needed
    };

    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      // Handle successful response
      print('Response data: ${response.body}');

      HospitalModel model = HospitalModel.fromJson(json.decode(response.body));

      return model;
    } else {
    // Handle error
    print('Error: ${response.statusCode}');
    return null;
    }
  }
}
