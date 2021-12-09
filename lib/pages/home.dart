// ignore_for_file: unused_import

import 'dart:async';
import 'dart:convert';
import 'package:entrega_final/model/Datos_Contactos.dart';
import 'package:entrega_final/model/agregar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:entrega_final/model/editar.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  bool loading = true;
  List<Datos_Employees> data = <Datos_Employees>[];
  Future<List<Datos_Employees>> getData() async {
    var url = Uri.parse('https://apidmi.herokuapp.com/TodosLosEmpleados');
    var response = await http.get(url, headers: {
      "Accept": "application/json",
    });

    var datos = jsonDecode(response.body);
    late var registros = <Datos_Employees>[];
    for (datos in datos) {
      registros.add(Datos_Employees.fromJson(datos));
    }
    return registros;
  }

  @override
  void initState() {
    super.initState();
    getData().then((value) {
      setState(() {
        data.addAll(value);
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Lista De Empleados"),
        ),
        drawer: MenuLateral(),
        body: Column(
          children: [
            Expanded(
                child: loading == true
                    ? Center(
                        child: Container(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              var nombre = data[index].nombre;
                              String salario = data[index].salario.toString();
                              String id = data[index].id.toString();
                              var lat = data[index].lat;
                              var long_ = data[index].long_;
                              Navigator.of(context).push(
                                  MaterialPageRoute<Null>(
                                      builder: (BuildContext context) {
                                return new Employees(
                                    id, nombre, salario, lat, long_);
                              }));
                            },
                            child: Container(
                              padding: EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                  /* border: Border(
                                      bottom: BorderSide(
                                          color: Colors.lightBlue, width: 5))*/
                                  ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data[index].id.toString() +
                                        "._ " +
                                        data[index].nombre,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(" "),
                                  Text(
                                    "Salario: " +
                                        data[index].salario.toString(),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ))
          ],
        ));
  }
}

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text("Entrega final",
                style: TextStyle(color: Colors.blueGrey, fontSize: 20)),
            accountEmail: Text("Realizado por Anayeli Gonzalez y Ulises Pérez",
                style: TextStyle(color: Colors.white)),
          ),
          Ink(
            color: Colors.indigo,
            child: new ListTile(
              title: Text(
                "Agregar empleados",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return new Agregar();
                }));
              },
            ),
          ),
          new ListTile(
            title: Text("Salir"),
            onTap: () {
              SystemNavigator.pop();
            },
          ),
          new ListTile(
            title: Text("Actualizar"),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute<Null>(builder: (BuildContext context) {
                return new HomePage();
              }));
            },
          ),
        ],
      ),
    );
  }
}
