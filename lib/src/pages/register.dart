import 'package:GestionPS/src/helpers/screen.dart';
import 'package:GestionPS/src/helpers/theme.dart';
import 'package:GestionPS/src/models/user.dart';
import 'package:GestionPS/src/providers/authProvider.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  /**
	 * FIELDS FOR REGISTER USER
	*/
  int _typeUser = null;
  String _name = null;
  String _email = null;
  String _password = null;
  String _confirPassword = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: <Widget>[
            Container(
              width: DeviceScreen.getWidth(context),
              height: DeviceScreen.getHeight(context) / 3,
              decoration: BoxDecoration(
                color: GPSColors.tertiary,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(360),
                  bottomLeft: Radius.circular(360),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Hero(
                      tag: "registerBtn",
                      child: Icon(
                        Icons.person_add,
                        size: 150,
                        color: GPSColors.white,
                      ),
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
                        prefixIcon: Icon(Icons.person),
                        labelText: "Nombre",
                      ),
                      validator: (value) {
                        if (value.length != 0) {
                          return null;
                        }
                        return "Por favor ingrese su nombre";
                      },
                      onSaved: (value) {
                        _name = value;
                      },
                    ),
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
                          if (emailRegExp.hasMatch(value)) {
                            return null;
                          }
                        }
                        return "Por favor ingrese un email válido";
                      },
                      onSaved: (value) {
                        _email = value;
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
                          if (value.length >= 8) {
                            return null;
                          }
                        }
                        return "Por favor ingrese una contraseña con 8 caracteres o mas";
                      },
                      onSaved: (value) {
                        _password = value;
                      },
                    ),
                    TextFormField(
                      cursorColor: GPSColors.secondary,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.vpn_key),
                        labelText: "Confirmar contraseña",
                      ),
                      validator: (value) {
                        if (value.isNotEmpty && value.length >= 8) {
                          _confirPassword = value;
                          return null;
                        }

                        return "Por favor ingrese una contraseña con 8 caracteres o mas";
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButton(
                        isExpanded: true,
                        value: _typeUser,
                        hint: Text("Tipo de usuario"),
                        items: [
                          DropdownMenuItem(
                            value: 0,
                            child: Text("Vendedor"),
                          ),
                          DropdownMenuItem(
                            value: 1,
                            child: Text("Cliente"),
                          ),
                        ],
                        onChanged: (value) {
                          _typeUser = value;
                          this.setState(() {});
                        }),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 30,
                    ),
                    RaisedButton(
                      textColor: GPSColors.white,
                      color: GPSColors.primary[700],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 50,
                            child: Icon(Icons.person_add),
                          ),
                          Text("Registrarme"),
                        ],
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate() &&
                            _typeUser != null) {
                          _formKey.currentState.save();

                          User usuario = User(
                            name: _name,
                            email: _email,
                            password: _password,
                            typeUser: _typeUser,
                          );

                          register(usuario);
                        }
                      },
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
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void register(User usuario) async {
    _onLoading();
    bool res = await AuthProvider.registerUser(usuario);
    Navigator.pop(context);

    if (res) {
      Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
    } else {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
            "Error al registrar usuario",
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(),
                SizedBox(height: 10),
                Text("Iniciando sesión"),
              ],
            ),
          ),
        );
      },
    );
  }
}
