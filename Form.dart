//Main.dart
import 'package:flutter/material.dart';
import './form.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      
      title: 'Flutter Form',
    
      theme: ThemeData(
        primarySwatch: Colors.deepPurple),
        
      
      home: const MyFormPage(data: '', title: '',),
    );
  }
}
//Form.dart
import 'package:flutter/material.dart';
import './homePage.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({Key? key, required this.title, required String data})
      : super(key: key);

  final String title;

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  String gender = "";
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: 'Enter UserName',
                           border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a username';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.email),
                          labelText: 'Enter Email',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          // Add validation logic for email
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 70),
                    Expanded(
                      child: TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Enter Password',
                          icon: Icon(Icons.password_rounded),
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),

              
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Gender   :'),
                        const Icon(Icons.man_outlined),
                        const Text('Male'),
                        Radio(
                          value: "male",
                           groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value!;
                            });
                          },
                         
                        ),
                        const Icon(Icons.woman_outlined),
                        const Text('Female'),
                        Radio(
                          value: "female",
                          onChanged: (value) {
                            setState(() {
                              gender = value!;
                            });
                          },
                          groupValue: gender,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: TextFormField(
                                controller: dobController,
                                decoration: const InputDecoration(
                                  labelText: 'Enter DOB',
                                  icon: Icon(Icons.calendar_month_outlined),
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  // Add validation logic for date of birth
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: FloatingActionButton(
                        // onPressed: () {
                        // if (_formkey.currentState!.validate()) {
                        //   String username = usernameController.text;
                        //   String email = emailController.text; // Get the email from the email text field
                        //   String password = passwordController.text;
                        //   String dob = dobController.text; // Get the date of birth from the DOB text field

                        //   String genderLabel = gender == "male" ? "Male" : "Female";

                        //   String message =
                        //       "Username: $username\nEmail: $email\nPassword: $password\nDOB: $dob\nGender: $genderLabel";
                        //   _showSnackBar(message);
                        // }
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyHomePage(
                                data: passwordController.text,
                                name: usernameController.text,
                                email: emailController.text,
                                dob: dobController.text),
                          ));
                        },
                        child: const Text('SUBMIT', style: TextStyle(fontSize: 10.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//HomePage.dart
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  // const MyNavPage({super.key});
  
  final String data;
  
  final String name;
  
  final String email;
  final String dob;
  const MyHomePage({super.key, required this.data,required this.name, required this.email,required this.dob});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Password : $data"),
            Text("Email : $email"),
            Text("NAME : $name"),
            Text("DOB : $dob"),
            
            // Text(
            //   'Welcome to My App!',
            //   style: TextStyle(fontSize: 24),
            // ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                //pop =we will back to main page
                Navigator.of(context).pop(context);
              },
              child: const Text(
                'Click Me',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            Text('NAVIGATE PAGE')
          ],
        ),
      ),
    );
  }
}
