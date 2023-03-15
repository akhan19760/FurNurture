import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store/constants.dart';
import 'package:furniture_store/model/user_model.dart';
import 'package:furniture_store/network/auth_controller.dart';
import 'package:furniture_store/provider/user_provider.dart';
import 'package:furniture_store/repository/auth_repository.dart';
import 'package:furniture_store/view/home_screen.dart';
import 'package:furniture_store/view/widgets/back_button.dart';
import 'package:furniture_store/view/widgets/custom_buttons.dart';
import 'package:furniture_store/view/widgets/custom_text.dart';
import 'package:furniture_store/view/widgets/custom_textfields.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthNetwork authNetwork = AuthNetwork();
  bool _isChecked = false;
  bool isLoading = false;
  bool isGoogleLoading = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController;
    _passwordController;
    _formKey;
    _loadUserEmailPassword();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackBtn(),
        title: CustomText('Login', Constants.primaryColor, 18, FontWeight.w600),
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
              child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                CustomTextfield(
                  hint: 'Email',
                  errorText: 'Email cannot be empty',
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
                    ),
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
                CustomText('Or log in with social account',
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
                )
              ],
            ),
          ))
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
      var _remeberMe = _prefs.getBool("remember_me") ?? false;

      print(_remeberMe);
      print(_email);
      print(_password);
      if (_remeberMe) {
        setState(() {
          _isChecked = true;
        });
        _emailController.text = _email;
        _passwordController.text = _password;
      }
    } catch (e) {
      print(e);
    }
  }
}
