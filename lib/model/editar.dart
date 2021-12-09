// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:entrega_final/pages/googleMaps.dart';
import 'package:entrega_final/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'controllers.dart';

class Employees extends StatefulWidget {
  String id;
  String nombre;
  String salario;
  String lat;
  String long_;
  Employees(this.id, this.nombre, this.salario, this.lat, this.long_);
  @override
  _BienvenidaState createState() => _BienvenidaState();
}

class _BienvenidaState extends State<Employees> {
  late String id;
  late String nombre;
  late String salario;
  late String lat;
  late String long_;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Información del Empleado: '),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: formkey,
                child: Column(
                  children: <Widget>[
                    // SizedBox(height: 50),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Nombre:"),
                      initialValue: widget.nombre,
                      onSaved: (value) {
                        nombre = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),
                    /*
                    TextFormField(
                      decoration: InputDecoration(labelText: "Correo:"),
                      initialValue: widget.email,
                      onSaved: (value) {
                        email = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),*/
                    TextFormField(
                      decoration: InputDecoration(labelText: "Sueldo:"),
                      initialValue: widget.salario,
                      onSaved: (value) {
                        salario = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),
                    /*
                    TextFormField(
                      decoration: InputDecoration(labelText: "Grupo:"),
                      initialValue: widget.group_,
                      onSaved: (value) {
                        group_ = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Dirección:"),
                      initialValue: widget.direccion,
                      onSaved: (value) {
                        direccion = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),*/
                    TextFormField(
                      decoration: InputDecoration(labelText: "Latitud:"),
                      initialValue: widget.lat,
                      onSaved: (value) {
                        lat = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Longitud:"),
                      initialValue: widget.long_,
                      onSaved: (value) {
                        long_ = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),
                    const SizedBox(height: 15),
                    Column(
                      children: <Widget>[
                        const SizedBox(height: 30),
                        RaisedButton(
                          padding: EdgeInsets.all(10),
                          color: Colors.yellowAccent,
                          textColor: Colors.white,
                          child: Text('Actualizar Información'),
                          onPressed: () {
                            setState(() {
                              _showSecondPage(context);
                            });
                            // Navigator.pop(context);
                          },
                        ),
                        const SizedBox(height: 30),
                        RaisedButton(
                          child: Text('Eliminar Empleado'),
                          color: Colors.redAccent,
                          textColor: Colors.white,
                          onPressed: () {
                            setState(() {
                              _deletes(context);
                            });
                            // Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    RaisedButton(
                      child: Text('Mostrar ubicación'),
                      color: Colors.lightBlue,
                      textColor: Colors.white,
                      onPressed: () {
                        _seeMaps(context);
                        // Navigator.pop(context);
                      },
                    ),
                  ],
                ))));
  }

  void _showSecondPage(BuildContext context) {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      updateEmployees(
          widget.id, this.nombre, this.salario, this.lat, this.long_);
      // Navigator.pop(context);
      Navigator.of(context)
          .push(new MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  void _deletes(BuildContext context) {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      deleteEmployees(widget.id);

      Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return HomePage();
      }));
    }
  }

  void _seeMaps(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return GoogleMaps(widget.lat, widget.long_, widget.nombre);
    }));
  }
}
