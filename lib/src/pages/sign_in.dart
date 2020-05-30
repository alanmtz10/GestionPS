import 'package:GestionPS/src/helpers/screen.dart';
import 'package:GestionPS/src/helpers/theme.dart';
import 'package:GestionPS/src/pages/register.dart';
import 'package:flutter/material.dart';

class IniciarSesion extends StatefulWidget {
  IniciarSesion({Key key}) : super(key: key);

  @override
  _IniciarSesionState createState() => _IniciarSesionState();
}

class _IniciarSesionState extends State<IniciarSesion> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: DeviceScreen.getWidth(context),
              height: DeviceScreen.getHeight(context) / 3,
              decoration: BoxDecoration(
                color: GPSColors.tertiary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(360),
                  bottomRight: Radius.circular(360),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      size: 150,
                      color: GPSColors.white,
                    ),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              width: DeviceScreen.getWidth(context) * 0.8,
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      cursorColor: GPSColors.secondary,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: "Correo electrónico",
                      ),
                      validator: (value) {
                        RegExp emailRegExp = RegExp(
                            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

                        if (value.isNotEmpty) {
                          return emailRegExp.hasMatch(value)
                              ? null
                              : "Por favor ingrese un email válido";
                        }

                        return "Por favor ingrese un email válido";
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      cursorColor: GPSColors.secondary,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.vpn_key),
                        labelText: "Contraseña",
                      ),
                      validator: (value) {
                        if (value.isNotEmpty) {
                          return value.length <= 8
                              ? null
                              : "Por favor ingrese una contraseña con 8 caracteres o mas";
                        }

                        return "Por favor ingrese una contraseña con 8 caracteres o mas";
                      },
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 30,
                    ),
                    RaisedButton(
                      textColor: GPSColors.white,
                      color: GPSColors.secondary[700],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 50,
                            child: Icon(Icons.vpn_key),
                          ),
                          Text("Iniciar sesión"),
                        ],
                      ),
                      onPressed: () {
                        _formKey.currentState.validate();
                      },
                    ),
                    RaisedButton(
                      textColor: GPSColors.white,
                      color: GPSColors.primary[700],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 50,
                            child: Hero(
                              tag: "registerBtn",
                              child: Icon(Icons.person_add),
                            ),
                          ),
                          Text("Registrarme"),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 700),
                            pageBuilder: (_, __, ___) => Register(),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
