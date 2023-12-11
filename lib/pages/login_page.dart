import 'package:flutter/material.dart';
import 'package:finalapp/routes.dart';
class LoginView extends StatelessWidget {
  const LoginView({Key? key}): super(key: key);


  @override
  Widget build(BuildContext context) {
    TextEditingController userController = TextEditingController();
    TextEditingController passController = TextEditingController();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
           children: [
             const Padding(padding: EdgeInsets.all(15)),
             const Text('Inicia Sesión', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
             const Padding(padding: EdgeInsets.all(10)),
             Container(
               width: MediaQuery.of(context).size.width*0.8,
               child: Column(
                 children: [
                   TextField(
                     controller: userController,
                     decoration: InputDecoration(
                       hintText: 'Usuario', labelText: 'Usuario',
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10.0),
                       ),
                     ),
                   ),
                   const Padding(padding: EdgeInsets.all(5)),
                   TextField(
                     obscureText: true,
                     controller: passController,
                     decoration:  InputDecoration(
                       hintText: 'Contraseña', labelText: 'Contraseña',
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10.0),
                       ),
                     ),
                   ),
                 ],
               ),
             ),
             const Padding(padding: EdgeInsets.all(10)),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Container(
                     width: MediaQuery.of(context).size.width*0.8,
                     child: Expanded(
                       child: ElevatedButton(onPressed: (){
                         Navigator.of(context).pushReplacementNamed('/typesfine');
                       }, child: const Text('Entrar'))),
                   )]
             )
           ],
          ),
        ),
      ),
    );
  }
}
