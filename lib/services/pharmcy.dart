import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  // Replace 'YOUR_API_KEY' with your actual API key
  final apiKey = 'YOUR_API_KEY';

  final url = 'https://api.example.com/data';

  // Include the API key in the headers
  final headers = {
    'Authorization': 'Bearer $apiKey',
    'Content-Type': 'application/json', // Adjust content type if needed
  };

  final response = await http.get(Uri.parse(url), headers: headers);

  if (response.statusCode == 200) {
    // Handle successful response
    print('Response data: ${response.body}');
  } else {
    // Handle error
    print('Error: ${response.statusCode}');
  }
}
