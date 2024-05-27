import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmedPasswordController = TextEditingController();

  bool _visiblePassword = false;
  bool _visibleConfirmedPassword = false;

  void _togglePassword (){
    setState(() {
      _visiblePassword = !_visiblePassword;
    });
  }

  void _toggleConfirmedPassword (){
    setState(() {
      _visibleConfirmedPassword = !_visibleConfirmedPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        Text("Registrarse", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                        Text("Crea tu cuenta"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: TextField(
                      controller: _userController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                          ),
                          hintText: 'Usuario',
                          prefixIcon: Icon(Icons.person)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                          ),
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email)),
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
                    child: TextField(
                      controller: _confirmedPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !_visibleConfirmedPassword,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                          ),
                          hintText: 'Confirmar Contraseña',
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: IconButton(
                              onPressed: _toggleConfirmedPassword,
                              icon: Icon(!_visibleConfirmedPassword? Icons.visibility: Icons.visibility_off)
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        context.go("/login");
                      },
                      style:
                          ElevatedButton.styleFrom(shape: const StadiumBorder(), padding: const EdgeInsets.symmetric(vertical: 16), backgroundColor: Colors.indigo),
                      child: const Center(
                          child: Text(
                        'Registrar',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: Row(
                      children: [
                        const Text("¿Ya tienes una cuenta?"),
                        TextButton(
                            onPressed: () {
                              context.go("/login");
                            },
                            child: const Text(
                              "Iniciar sesion",
                              style: TextStyle(color: Colors.indigo),
                            ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ])));
  }
}
