import 'package:auth_app/pages/forgot_pw_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage(
    {Key? key,
    required this.showRegisterPage}):
    super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {

    //loading indicator
    showDialog(
      context: context, 
      builder: (context){
        return Center(child: CircularProgressIndicator());
      }
      );
      //sign in request
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(), 
      password: _passwordController.text.trim(),
      );

     //pop the loading circle
      Navigator.of(context).pop();
  }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();

  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.android,
                  size: 100,
                ),
                SizedBox(height:10),
                //Hello again
                Text(
                  'Hello Again!',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 36
                     )
                ),
                SizedBox(height:10),
                Text(
                  'Welcome,we missed you!!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height:20),
                //Email textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                            
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:30),
                //password textfield
              Padding(
                    padding: const EdgeInsets.symmetric(horizontal:25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context){
                                return ForgotPasswordPage();
                                }
                                )
                                );
                          },
                          child: Text('forgot password?',
                          style: TextStyle(
                            color:  Colors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:10),
                //signin button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:25.0),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color:Colors.blue ,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white)
                        ),
                      child: Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color:Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                          ),
                          ))),
                  ),
                ),
                SizedBox(height:10),
              //not a member?Register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member?',
                  style: TextStyle(
                      color:  Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: Text(
                      ' Register now',
                      style: TextStyle(
                        color:  Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ],
              ),
            
              ]
              ,
            ),
          ),
        ),
      ),
    );
  }
}