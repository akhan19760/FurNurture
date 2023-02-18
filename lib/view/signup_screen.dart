import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/model/user_model.dart';
import 'package:furniture_app/network/auth_controller.dart';
import 'package:furniture_app/provider/user_provider.dart';
import 'package:furniture_app/repository/auth_repository.dart';
import 'package:furniture_app/view/home_screen.dart';
import 'package:furniture_app/view/widgets/back_button.dart';
import 'package:furniture_app/view/widgets/custom_buttons.dart';
import 'package:furniture_app/view/widgets/custom_text.dart';
import 'package:furniture_app/view/widgets/custom_textfields.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  AuthNetwork authNetwork = AuthNetwork();
  bool _isChecked = false;
  bool isLoading = false;
  bool isGoogleLoading = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController;
    _nameController;
    _passwordController;
    _confirmPasswordController;
    _formKey;
    _loadUserEmailPassword();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackBtn(),
        title:
            CustomText('Sign Up', Constants.primaryColor, 18, FontWeight.w600),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Constants.secondaryColor,
      ),
      backgroundColor: Constants.secondaryColor,
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  CustomTextfield(
                    hint: 'Name',
                    errorText: 'Name field cannot be empty',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Constants.primaryColor,
                    ),
                    suffixIcon: const SizedBox(),
                    controller: _nameController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextfield(
                    hint: 'Email',
                    errorText: 'Email field cannot be empty',
                    prefixIcon: Icon(
                      Icons.email,
                      color: Constants.primaryColor,
                    ),
                    suffixIcon: const SizedBox(),
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PasswordField(
                    label: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Constants.primaryColor,
                    ),
                    controller: _passwordController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      child: CustomText(
                        'Forgot Password?',
                        Constants.primaryColor,
                        14,
                        FontWeight.w500,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: CustomText('Remember me', Constants.primaryColor,
                            14.0, FontWeight.w500),
                      ),
                      Checkbox(
                        value: _isChecked,
                        onChanged: _handleRemeberme,
                        checkColor: Constants.secondaryColor,
                        fillColor: MaterialStateColor.resolveWith(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Constants.primaryColor;
                            }
                            return Constants.primaryColor;
                          },
                        ),
                      )
                    ],
                  ),
                  isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Constants.secondaryColor,
                          ),
                        )
                      : CustomButton('Login', const SizedBox(), () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            try {
                              await authNetwork.signInUser(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim());
                              var id = FirebaseAuth.instance.currentUser!.uid;
                              UserModel user =
                                  await AuthRepository.getUserProfile(
                                      id, context);
                              context.read<UserProvider>().user = user;

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                              setState(() {
                                isLoading = false;
                              });
                            } on FirebaseAuthException catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(e.message!),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 5),
                                ),
                              );
                            }
                          }
                        }, Constants.bigBtnWidth, Constants.bigBtnHeight,
                          Constants.secondaryColor, Constants.btnPrimColor),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomText('Or sign up with social account',
                      Constants.primaryColor, 14, FontWeight.w500),
                  const SizedBox(
                    height: 30,
                  ),
                  isGoogleLoading
                      ? Center(
                          child: CircularProgressIndicator(
                              color: Constants.secondaryColor),
                        )
                      : SocialButton(
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: 30,
                              child: Image.asset(
                                'assets/images/google-icon.png',
                              )),
                          'Continue with Google',
                          () async {
                            setState(() {
                              isGoogleLoading = true;
                            });
                            try {
                              context.read<UserProvider>().user =
                                  await AuthRepository.googleSignin();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                              setState(() {
                                isLoading = false;
                              });
                            } on FirebaseAuthException catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(e.message!),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 5),
                                ),
                              );
                            }
                          },
                          Constants.bigBtnWidth,
                          Constants.bigBtnHeight,
                          Constants.secondaryColor,
                          Constants.btnPrimColor,
                        ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleRemeberme(bool? value) {
    print("Handle Rember Me");
    _isChecked = value!;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('email', _emailController.text);
        prefs.setString('password', _passwordController.text);
        prefs.setString('name', _nameController.text);
      },
    );
    setState(() {
      _isChecked = value;
    });
  }

  void _loadUserEmailPassword() async {
    print("Load Email");
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _email = _prefs.getString("email") ?? "";
      var _password = _prefs.getString("password") ?? "";
      var _name = _prefs.getString("name") ?? "";
      var _remeberMe = _prefs.getBool("remember_me") ?? false;

      print(_remeberMe);
      print(_email);
      print(_password);
      print(_name);
      if (_remeberMe) {
        setState(() {
          _isChecked = true;
        });
        _emailController.text = _email;
        _passwordController.text = _password;
        _nameController.text = _name;
      }
    } catch (e) {
      print(e);
    }
  }
}
