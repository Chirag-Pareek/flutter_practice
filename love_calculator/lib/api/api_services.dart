import 'dart:convert';
import 'package:http/http.dart' as http;

class LoveCalculatorService {
  static const String _url =
      'https://the-love-calculator.p.rapidapi.com/love-calculator';
  static const Map<String, String> _headers = {
    'X-RapidAPI-Key':
        "0511330f87mshdbc9319fe3bf9b0p13aaeajsnb2db034254d4", // Replace with your key
    'X-RapidAPI-Host': 'the-love-calculator.p.rapidapi.com',
  };

  static Future<Map<String, dynamic>> getLoveResult(
    String name1,
    String name2,
  ) async {
    final uri = Uri.parse('$_url?fname=$name1&sname=$name2');
    final resp = await http.get(uri, headers: _headers);

    //ignore: avoid_print
    print('💬 API Response (${resp.statusCode}): ${resp.body}');

    if (resp.statusCode == 200) {
      return json.decode(resp.body) as Map<String, dynamic>;
    } else {
      throw Exception('API error: ${resp.statusCode}');
    }
  }
}
