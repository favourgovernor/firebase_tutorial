import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage(
    {
      Key? key,
      required this.showLoginPage,
    }):super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();

  Future signUp() async {
    if(passwordConfirmed()){
      //create user
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(), 
      password: _passwordController.text.trim(),
   
    );
    //add user details
    addUserDetails(
      _firstNameController.text.trim(), 
      _lastNameController.text.trim(), 
      _emailController.text.trim(),  
      int.parse(_ageController.text.trim()),
    );
  }

  }
   
  Future addUserDetails(String firstName, String lastName, String email, int age) async {
  await FirebaseFirestore.instance.collection('users').add({
    'firstName':firstName,
    'lastName': lastName,
    'email': email,
    'age': age
  });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() == _confirmpasswordController.text.trim()){
        return true;
      } else {
        return false;
      }
    }
  @override
   void dispose(){
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();

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
                /*Icon(
                  Icons.android,
                  size: 100,
                ),*/
                SizedBox(height:10),
                //Hello again
                Text(
                  'Hey There!',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 36
                     )
                ),
                SizedBox(height:10),
                Text(
                  'Register your details below',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height:20),
                //firstName textfield
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
                          controller: _firstNameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'First Name',
                            
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:20),
                  //Last Name textfield
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
                          controller: _lastNameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Last Name',
                            
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:20),
                  //age textfield
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
                          controller: _ageController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'age',
                            
                          ),
                        ),
                      ),
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
                  SizedBox(height:20),
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
                   SizedBox(height:20),

                //confirm password textfield
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
                          controller: _confirmpasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'confirm password',
                            
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:20),
                //signUp button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:25.0),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color:Colors.blue ,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white)
                        ),
                      child: Center(
                        child: Text(
                          'Sign Up',
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
                  Text('I am a member?',
                  style: TextStyle(
                      color:  Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.showLoginPage,
                    child: Text(
                      ' Sign In',
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