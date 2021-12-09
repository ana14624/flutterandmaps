// ignore_for_file: deprecated_member_use

import 'package:entrega_final/pages/home.dart';
import 'package:flutter/material.dart';
import 'controllers.dart';
import 'package:flutter/services.Dart';

class Agregar extends StatefulWidget {
  @override
  _CreateEmployees createState() => _CreateEmployees();
}

class _CreateEmployees extends State<Agregar> {
  late TextEditingController nameTextController;
  late TextEditingController salarioTextController;
  late String nombre;
  late String salario;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Agregar empleado'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: formkey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50),
                    TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(255),
                      ],
                      decoration: InputDecoration(labelText: "Nombre:"),
                      initialValue: '',
                      onSaved: (value) {
                        nombre = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '¡Campo Vacio!';
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Salario:"),
                      keyboardType: TextInputType.number,
                      initialValue: '',
                      onSaved: (value) {
                        salario = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    RaisedButton(
                      child: Text('Agregar'),
                      onPressed: () {
                        setState(() {
                          _addEmployees(context);
                        });
                      },
                    ),
                  ],
                ))));
  }

  void _addEmployees(BuildContext context) {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      createEmployees(this.nombre, this.salario);
      // Navigator.of(context).Push(new MaterialPageRoute(builder: (context) => HomePage())).whenComplete(retrieveData);
      Navigator.of(context)
          .push(new MaterialPageRoute(builder: (context) => HomePage()));
      // Navigator.of(context)
      //     .push(new MaterialPageRoute<String>(builder: (BuildContext context) {
      //   return new HomePage();
      // }));
    }
  }
}
