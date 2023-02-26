import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/bloc/authentication/auth_bloc.dart';
import 'package:mobile_shop/bloc/authentication/auth_event.dart';
import 'package:mobile_shop/bloc/authentication/auth_state.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _usernameTextController = TextEditingController(text: 'amirmahdi');
  final _passwordTextController = TextEditingController(text: '12345678');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  child: Image.asset('assets/images/logo_Apple.png'),
                  color: Colors.blue,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'اپل شاپ',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'SB',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: TextField(
                          controller: _usernameTextController,
                          decoration: InputDecoration(
                            labelText: 'نام کاربری',
                            labelStyle: TextStyle(fontFamily: 'SB'),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 3),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 3),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: TextField(
                          controller: _passwordTextController,
                          decoration: InputDecoration(
                            labelText: 'رمز عبور',
                            labelStyle: TextStyle(fontFamily: 'SB'),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 3,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 3,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (((context, state) {
                          if (state is AuthInitiateState) {
                            return ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<AuthBloc>(context).add(
                                  AuthLoginRequest(
                                    _usernameTextController.text,
                                    _passwordTextController.text,
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                minimumSize: Size(200, 50),
                              ),
                              child: Text(
                                'ورود به حساب کاربری',
                                style: TextStyle(
                                  fontFamily: 'SB',
                                  fontSize: 18,
                                ),
                              ),
                            );
                          }
                          if (state is AuthLoadingState) {
                            return CircularProgressIndicator(
                              backgroundColor: Colors.black,
                            );
                          }
                          if (state is AuthResponseState) {
                            return state.response
                                .fold((l) => Text(l), (r) => Text(r));
                          }
                          return CircularProgressIndicator(
                            backgroundColor: Colors.black,
                          );
                        })),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
