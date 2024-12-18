import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../../common_widgets/CustomTextfield.dart';
import '../../pages/home/home_screen.dart';
import '../../model/user_data.dart';
import '../../register/provider/RegisterProvider.dart';
import '../../services/database_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).highlightColor,
        title: const Center(child: Text("Login"
        ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),
        )
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Email TextField
                CustomTextField(
                  labelText: "Email",
                  hintText: "Enter your email",
                  prefixIcon: const Icon(Icons.email),
                  controller: _emailController,
                  focusNode: _emailFocus,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_passwordFocus);
                  },
                ),
                const SizedBox(height: 16),

                // Password Field
                CustomTextField(
                  labelText: "Password",
                  hintText: "Enter your password",
                  prefixIcon: const Icon(Icons.lock),
                  controller: _passwordController,
                  focusNode: _passwordFocus,
                  obscureText: !registerProvider.isPasswordVisible,
                  isPasswordField: true,
                  suffixIconAction: registerProvider.passwordVisibility,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) {
                    if (_formKey.currentState!.validate()) {
                      _login(_emailController.text, _passwordController.text);
                    }
                  },
                ),
                const SizedBox(height: 16),

                // Login Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _login(_emailController.text, _passwordController.text);
                    }
                  },
                  child: const Text("Login"),
                ),
                const SizedBox(height: 16),

                // Register Navigation
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/register');
                  },
                  child: const Text("Don't have an account? Register"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    User? user =
    await DatabaseHelper().getUserByEmailAndPassword(email, password);
    if (user != null) {
      prefs.setInt('userId', user.id!); // Save userId to SharedPreferences
      prefs.setBool('isLoggedIn', true); // Set login status to true

      // Replace the current screen and clear navigation stack
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false, // Remove all previous routes
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email or password')),
      );
    }
  }

}
