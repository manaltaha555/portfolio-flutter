import 'dart:convert';
import 'package:http/http.dart' as http;
import '../data/models/form_model.dart';
class FormService {

  Future<http.Response?> sendMessage(FormModel form) async {
    final url = Uri.parse("https://formspree.io/f/xblzykbw");

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode(form.toJson()),
    );
    return response;
  }
}