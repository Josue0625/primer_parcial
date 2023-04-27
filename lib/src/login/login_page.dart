import 'package:primer_parcial/src/login/login_controller.dart';
import 'package:primer_parcial/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _con = new LoginController();
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPersistentFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryOpacityColor,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Center(
                child: Container(
                  width: 400,
                  height: 180,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                    color: MyColors.primaryColorDart,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Row(
                          children: const [
                            SizedBox(width: 35),
                            Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        _textFieldEmail(),
                        _textFieldPassword(),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 490,
                left: 3,
                right: 195,
                child: _buttonLogin(),
              ),
              Positioned(
                top: 490,
                left: 195,
                right: 1,
                child: _buttonRegister(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      decoration: BoxDecoration(
          color: MyColors.secundaryColorDart,
          borderRadius: BorderRadius.circular(22)),
      child: TextField(
        controller: _con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Email',
            hintStyle: TextStyle(color: MyColors.secundaryColor),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(20),
            prefixIcon: Icon(
              Icons.email,
              color: MyColors.secundaryColor,
            )),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      decoration: BoxDecoration(
          color: MyColors.secundaryColorDart,
          borderRadius: BorderRadius.circular(22)),
      child: TextField(
        obscureText: true,
        controller: _con.passwordController,
        decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: TextStyle(color: MyColors.secundaryColor),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(20),
            prefixIcon: Icon(
              Icons.lock,
              color: MyColors.secundaryColor,
            )),
      ),
    );
  }

  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
        color: MyColors.primaryColorDart,
        borderRadius: BorderRadius.circular(25),
      ),
      child: ElevatedButton(
        onPressed: _con.login,
        style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.symmetric(vertical: 15)),
        child: const Text(
          'Sign In',
          style: TextStyle(
            fontSize: 20, // Aquí cambias el tamaño del texto
            fontWeight: FontWeight.normal, // Otras propiedades de estilo
          ),
        ),
      ),
    );
  }

  Widget _buttonRegister() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
        color: MyColors.primaryColorDart,
        borderRadius: BorderRadius.circular(25),
      ),
      child: ElevatedButton(
        onPressed: _con.login,
        style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.tercerColorDart,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            padding: const EdgeInsets.symmetric(vertical: 17)),
        child: Text(
          'Sign In with',
          style: TextStyle(
            fontSize: 18, // Aquí cambias el tamaño del texto
            fontWeight: FontWeight.bold, // Otras propiedades de estilo
            color: MyColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
