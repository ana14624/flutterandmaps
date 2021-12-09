import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// delete
Future<http.Response?> deleteEmployees(String id) async {}

Future<http.Response> updateEmployees(
    String id, String nombre, String salario, String lat, String long_) {
  return http.put(
    Uri.parse('https://apidmi.herokuapp.com/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'nombre': nombre,
      'salario': salario,
      'lat': lat,
      'long_': long_
    }),
  );
}

Future<http.Response> createEmployees(String nombre, String salario) {
  return http.post(
    Uri.parse('https://apidmi.herokuapp.com/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'nombre': nombre, 'salario': salario}),
  );
}
