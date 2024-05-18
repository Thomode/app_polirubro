import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _visiblePassword = false;

  void _togglePassword (){
    setState(() {
      _visiblePassword = !_visiblePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 60),
                    child: Column(
                      children: [
                        Text("Bienvenido", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                        Text("Ingrese sus credenciales para iniciar sesion"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: TextField(
                      controller: _userController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                          ),
                          hintText: 'Usuario o Email',
                          prefixIcon: Icon(Icons.person)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: TextField(
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !_visiblePassword,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                          ),
                          hintText: 'Contraseña',
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: IconButton(
                              onPressed: _togglePassword,
                              icon: Icon(!_visiblePassword? Icons.visibility: Icons.visibility_off)
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        context.go("/product");
                      },
                      style:
                          ElevatedButton.styleFrom(shape: const StadiumBorder(), padding: const EdgeInsets.symmetric(vertical: 16), backgroundColor: Colors.indigo),
                      child: const Center(
                          child: Text(
                        'Iniciar Sesion',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      child: TextButton(
                          onPressed: () {
                            context.go("/forgot-password");
                          },
                          child: const Text(
                            "¿Has olvidado tu contraseña?",
                            style: TextStyle(color: Colors.indigo),
                          ))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: Row(
                      children: [
                        const Text("¿No tienes una cuenta?"),
                        TextButton(
                            onPressed: () {
                              context.go("/register");
                            },
                            child: const Text(
                              "Registrarse",
                              style: TextStyle(color: Colors.indigo),
                            )
                        )
                      ],
                    ),
                  )
                ],
              ),
            ])));
  }
}
