import 'package:driver_app/model/DriverState.dart';
//import 'package:driver_app/screens/HomeScreen.dart';
import 'package:driver_app/service/AppStateService.dart';
import 'package:driver_app/service/DriverService.dart';
import 'package:driver_app/service/SessionService.dart';
import 'package:flutter/material.dart';
import 'package:driver_app/components/login/LoginBackground.dart';
import 'package:driver_app/components/login/LoginHeader.dart';
import 'package:driver_app/components/login/LoginTextField.dart';
import 'package:driver_app/components/login/LoginButtonRow.dart';
import 'package:driver_app/components/login/SocialLogin.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController=TextEditingController();
  final passwordController=TextEditingController();

  final sessionService= SessionService();

  final driverService=DriverService();
  bool showError=false;

  @override
  Widget build(BuildContext context) {
    return LoginBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            const LoginHeader(),

            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(
                  40,
                  MediaQuery.of(context).size.height * 0.5,
                  40,
                  0,
                ),
                child: Column(
                  children: [

                    if (showError)
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.red,
                      child: const Text(
                        "Invalid credentials",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    LoginTextField(
                      controller: emailController,
                      hint: "Email / Phone Number",
                    ),
                    const SizedBox(height: 15),

                    LoginTextField(
                      hint: "Password",
                      isPassword: true,
                      controller: passwordController,
                    ),
                    const SizedBox(height: 30),

                    LoginButtonRow(
                      onLogin: () async {

                        final driver = await driverService.login(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );

                        if (driver != null) {

                          await SessionService().saveLogin(driver.email);
                          // SUCCESS → Go to Home
                          AppStateService.setDriver(driver);
                          AppStateService.setState(DriverState.OFFLINE);

                          Navigator.pushReplacementNamed(context, "/home");
                        } else {
                          //  FAIL → Show error
                          setState(() {
                            showError = true;
                          });

                          Future.delayed(const Duration(seconds: 2), () {
                            setState(() {
                              showError = false;
                            });
                          });
                        }
                      },
                    ),

                    const SizedBox(height: 25),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/signup");
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.grey.shade900,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot Password",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SocialLogin(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}