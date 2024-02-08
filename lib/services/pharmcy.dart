import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uzaydan_misafirler/models/pharmcymodel.dart';

class PharmcyDD{
  Future<Pharmcy?> fetchData() async {
    // Replace 'YOUR_API_KEY' with your actual API key
    final apiKey = 'kDwbmijDsc9eoEwpLe80eODIgT8ubloO2CXJO1tjzjbXFBlcqQSnnhA9ItGg';

    final url = ' https://www.nosyapi.com/apiv2/pharmacy';

    // Include the API key in the headers
    final headers = {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json', // Adjust content type if needed
    };

    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      // Handle successful response
      print('Response data: ${response.body}');
      Pharmcy model = Pharmcy.fromJson(json.decode(response.body));

      return model;
    } else {
      // Handle error
      print('Error: ${response.statusCode}');
      return null;
    }
  }
}
