import 'package:flutter/material.dart';
import '../../common_widgets/CustomTextfield.dart';
import '../../../core/utils/validator.dart';
import 'package:provider/provider.dart';
import '../provider/RegisterProvider.dart';
import '../services/RegisterService.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final FocusNode _firstNameFocus = FocusNode();
  final FocusNode _lastNameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();

  // Dispose the focus nodes to free resources
  @override
  void dispose() {
    _firstNameFocus.dispose();
    _lastNameFocus.dispose();
    _emailFocus.dispose();
    _phoneFocus.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Container(
            alignment: Alignment.center, // Center the title horizontally
            width: MediaQuery.of(context).size.width * 0.6,
            child: const Text(
              "Register",
              style: TextStyle(
                fontSize: 24, // Adjust font size
                fontWeight: FontWeight.bold,
                color: Colors.black, // Change text color
              ),
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the login page
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  labelText: "First Name",
                  hintText: "Enter your first name",
                  prefixIcon:
                      const Icon(Icons.person, color: Colors.deepPurple),
                  controller: _firstNameController,
                  focusNode: _firstNameFocus,
                  validator: Validator.firstName.call,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_lastNameFocus);
                  },
                ),
                CustomTextField(
                  labelText: "Last Name",
                  hintText: "Enter your last name",
                  prefixIcon:
                      const Icon(Icons.person, color: Colors.deepPurple),
                  controller: _lastNameController,
                  focusNode: _lastNameFocus,
                  validator: Validator.lastName.call,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_emailFocus);
                  },
                ),
                CustomTextField(
                  labelText: "Email",
                  hintText: "Enter your email",
                  prefixIcon: const Icon(Icons.email, color: Colors.blue),
                  controller: _emailController,
                  focusNode: _emailFocus,
                  validator: Validator.email.call,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_phoneFocus);
                  },
                ),
                CustomTextField(
                  labelText: "Mobile",
                  hintText: "Enter your mobile number",
                  prefixIcon: const Icon(Icons.phone,
                      color: Color.fromRGBO(10, 225, 19, 100)),
                  controller: _phoneNoController,
                  focusNode: _phoneFocus,
                  keyboardType: TextInputType.phone,
                  validator: Validator.mobile.call,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_passwordFocus);
                  },
                ),
                CustomTextField(
                  labelText: "Password",
                  hintText: "Enter your password",
                  prefixIcon: const Icon(Icons.lock, color: Colors.black),
                  controller: _passwordController,
                  focusNode: _passwordFocus,
                  obscureText: !registerProvider.isPasswordVisible,
                  isPasswordField: true,
                  suffixIconAction: registerProvider.passwordVisibility,
                  validator: Validator.password.call,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_confirmPasswordFocus);
                  },
                ),
                CustomTextField(
                  labelText: "Confirm Password",
                  hintText: "Re-enter your password",
                  prefixIcon:
                      const Icon(Icons.lock_outline, color: Colors.black),
                  controller: _confirmPasswordController,
                  focusNode: _confirmPasswordFocus,
                  obscureText: !registerProvider.isConfirmPasswordVisible,
                  isPasswordField: true,
                  suffixIconAction: registerProvider.confirmPasswordVisibility,
                  validator: (value) =>
                      Validator.confirmPassword(value, _passwordController),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Call RegisterService to handle registration logic
                      RegisterService().registerUser(
                        context,
                        _firstNameController.text,
                        _lastNameController.text,
                        _emailController.text,
                        _phoneNoController.text,
                        _passwordController.text,
                      );
                    }
                  },
                  child: const Text("Register"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
