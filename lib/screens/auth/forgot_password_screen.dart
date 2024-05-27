import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

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
                        Text("Resetear Contraseña", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                        Text("Por favor ingrese su direccion de email"),
                      ],
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
                    child: ElevatedButton(
                      onPressed: () {
                        context.go("/login");
                      },
                      style:
                          ElevatedButton.styleFrom(shape: const StadiumBorder(), padding: const EdgeInsets.symmetric(vertical: 16), backgroundColor: Colors.indigo),
                      child: const Center(
                          child: Text(
                        'Resetear Contraseña',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      child: TextButton(
                          onPressed: () {
                            context.go("/login");
                          },
                          child: const Text(
                            "Volver",
                            style: TextStyle(color: Colors.indigo),
                          ))),
                ],
              ),
            ])));
  }
}
