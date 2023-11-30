import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/quote.dart';

Future fetchQuote() async {
  final http.Response response = await http.get(
      Uri.parse('https://api.api-ninjas.com/v1/quotes?category=happiness'),
      headers: {'X-Api-Key': 'f22BnXw/ySbhUH1A9Zo1aw==1XwSOvtSn1XPgAiY'});

  if (response.statusCode == 200) {
    print(response);
    return response;
  } else {
    print('Error: ${response.statusCode}');
  }
  return 'Error getting Quotes';
}

Future<Quote> decodeQuote(http.Response response) async {
  List jsonData = jsonDecode(response.body);
  return Quote.fromJson(jsonData);
}
