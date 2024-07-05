import 'package:flutter/material.dart';
import 'secondscreen.dart';

class FirstScreen extends StatelessWidget {
  // Controladores para los campos de texto
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Usuario y contraseña válidos (simulados)
  final String validUsername = 'USUARIO';
  final String validPassword = 'PASSWORD123';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primera Pantalla'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Campo de texto para el usuario
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: 'Usuario',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // Campo de texto para la contraseña
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // Botón para validar usuario y contraseña
            ElevatedButton(
              child: Text('Iniciar Sesión'),
              onPressed: () {
                String username = usernameController.text.trim();
                String password = passwordController.text.trim();

                // Validación de usuario y contraseña
                if (username == validUsername && password == validPassword) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SecondScreen(data: 'Hola desde la Primera Pantalla'),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error de inicio de sesión'),
                        content: Text('Usuario o contraseña incorrectos.'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
