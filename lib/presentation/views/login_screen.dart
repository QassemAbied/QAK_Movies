import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/presentation/state_management/authentication_bloc/authentication_bloc.dart';
import 'package:untitled3/presentation/state_management/authentication_bloc/authentication_states.dart';
import 'package:untitled3/presentation/views/first_screen.dart';
import '../state_management/authentication_bloc/authentication_event.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final nameController = TextEditingController();

  final passwordController = TextEditingController();

  final FromKey = GlobalKey<FormState>();

  IconData suffix = Icons.visibility_off;
  bool isPasswordShow = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationStates>(
      listener: (context, state) {
        if (state.login?.success == true) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FirstView()));
        } else {
          print(state.messagesession.toString());
        }
      },
      builder: (context, state) {
        return Scaffold(
          // appBar: AppBar(),
          body: Form(
            key: FromKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Column(
                      children: [
                        Image(
                          image: AssetImage('assets/image/clapperboard.png'),
                          height: 150,
                          width: 200,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Welcome To QAK_Movies',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            shadows: [
                              Shadow(
                                blurRadius: 0.2,
                                color: Colors.blueGrey.shade400,
                                offset: Offset.fromDirection(100),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Name is Not Correct';
                        }
                      },
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'Enter your UserName',
                        labelText: 'UserName',
                        prefixIcon: Icon(Icons.drive_file_rename_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.black)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.red)),
                        focusColor: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is Not Correct ';
                        }
                      },
                      onFieldSubmitted: (value) {
                        if (FromKey.currentState!.validate()) {
                          BlocProvider.of<AuthenticationBloc>(context)
                            ..add(LoginValidateEvent(
                              name: nameController.text,
                              password: passwordController.text,
                              token: state.requestToken!.request_token,
                            ));
                        }
                      },
                      obscureText: isPasswordShow,
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Enter your Password',
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.password),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              suffix = isPasswordShow
                                  ? Icons.visibility
                                  : Icons.visibility_off;
                              isPasswordShow = !isPasswordShow;
                            });
                          },
                          icon: Icon(suffix),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.black)),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusColor: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      color: Colors.black,
                      onPressed: () {
                        if (FromKey.currentState!.validate()) {
                          BlocProvider.of<AuthenticationBloc>(context)
                            ..add(LoginValidateEvent(
                              name: nameController.text,
                              password: passwordController.text,
                              token: state.requestToken!.request_token,
                            ));
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 0.2,
                              color: Colors.blueGrey.shade400,
                              offset: Offset.fromDirection(100),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
