import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController universityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Registration'),
        backgroundColor: Colors.amber.shade900,
      ),

      body: Center(
        //SingleChildScrollView is used to make the screen scrollable when the keyboard appears.
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16.0),
            child: Card(
              // card 不能放const 因为button有actions
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    //email
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email), // add the icon
                        labelText: 'Email', //before click the text field
                        hintText:
                            'Enter your email', //after click the text field
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.amber,
                            width: 2.0,
                          ),
                        ),
                      ),
                      keyboardType:
                          TextInputType.emailAddress, // if email --> @
                    ),

                    //pass
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock), // add the icon
                        labelText: 'Password', //before click the text field
                        hintText:
                            'Enter your password', //after click the text field
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.amber,
                            width: 2.0,
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {},
                        ),
                      ),
                      obscureText: true, // hide the password
                    ),

                    //confirm pass
                    TextField(
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                        label: const Text(
                          'Confirm Password',
                        ), //before click the text field
                        hintText:
                            'Re-enter your password', //after click the text field
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.amber,
                            width: 2.0,
                          ),
                        ),
                      ),
                      obscureText: true, // hide the password
                    ),

                    //address
                    TextField(
                      controller: addressController,
                      maxLines: 5, // 格子的行数
                      maxLength: 18, // 格子的字数
                      decoration: InputDecoration(
                        label: const Text(
                          'Address',
                        ), //before click the text field
                        hintText:
                            'Enter your address', //after click the text field
                        prefixIcon: const Icon(Icons.home), // add the icon
                      ),
                    ),

                    //phone
                    TextField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        labelText: 'Phone Number', //before click the text field
                        hintText:
                            'Enter your phone number', //after click the text field
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.amber,
                            width: 2.0,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                    ), //phone
                    //university
                    TextField(
                      controller: universityController,
                      decoration: InputDecoration(
                        labelText: 'University', //before click the text field
                        hintText:
                            'Enter your university', //after click the text field
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.amber,
                            width: 2.0,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),

                    SizedBox(height: 16),

                    //button
                    Container(
                      //can use container or sizedbox to increase the width of the button.
                      width: 400,
                      child: ElevatedButton(
                        onPressed: registerUser,
                        child: Text('Resgiter'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void registerUser() {
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    String address = addressController.text;
    String phone = phoneController.text;
    String university = universityController.text;

    if (email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        address.isEmpty ||
        phone.isEmpty ||
        university.isEmpty) {
      // show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
    } else if (password != confirmPassword) {
      // show error message
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Passwords do not match')));
    } else {
      // show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registration successful'),
          backgroundColor: Colors.green,
        ),
      );
      return;
    }

    
  }
}
