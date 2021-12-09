// ignore_for_file: camel_case_types

class Datos_Employees {
  late int id;
  late String nombre;
  late String salario;
  late String lat;
  late String long_;

  Datos_Employees(
      int id, String nombre, String salario, String lat, String long_);

  Datos_Employees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    salario = json['salario'];
    lat = json['lat'];
    long_ = json['long_'];
  }
}
