import 'dart:convert';

import 'package:http/http.dart' as http;

Future getResponse(int limit) async {
  http.Response response = await http.get(
      Uri.parse('https://api.api-ninjas.com/v1/quotes?limit=$limit'),
      headers: {'X-Api-Key': 'f22BnXw/ySbhUH1A9Zo1aw==1XwSOvtSn1XPgAiY'});

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    print('Error: ${response.statusCode}');
  }
  return 'Error getting Quotes';
}
