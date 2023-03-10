import 'package:flutter/material.dart';
import 'package:habit_app_front/repository/user_repository.dart';
import 'package:habit_app_front/screens/NavbarPage.dart';
import 'package:habit_app_front/screens/SignpPage.dart';
import '../../app_styles.dart';
import '../../size_configs.dart';
import '../../validators.dart';
import '../../widgets/widgets.dart';
import '../utils/messages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginKey = GlobalKey<FormState>();
  final _usernameControler = TextEditingController();
  final _passwordController = TextEditingController();

  void onSubmit() async {
    if (_loginKey.currentState!.validate()) {
      try {
        UserRepository userRepository = UserRepository();
        bool isLogin = await UserRepository()
            .login(_usernameControler.text, _passwordController.text);
        if (isLogin) {
          displaySuccessMessage(context, "Login Successful!");
          Future.delayed(Duration(seconds: 2), () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavbarPage()));

          });
        } else {
          displayErrorMessage(context, "Wrong username or password!");
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  List<FocusNode> _loginFocusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    super.initState();
    _loginFocusNodes.forEach((element) {
      element.addListener(() {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.blockSizeV!;
    return Stack(
      children: [
        Positioned(
          bottom: height * 2,
          child: Container(
            child: Image.asset('assets/images/auth/login_bg.png'),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Welcome to\nMonumental Habits',
                            style: kTitle,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                LargeIconButton(
                                  buttonName: 'Continue with Google',
                                  iconImage:
                                      'assets/images/auth/google_icon.png',
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                LargeIconButton(
                                  buttonName: 'Continue with Facebook',
                                  iconImage:
                                      'assets/images/auth/facebook_icon.png',
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 14,
                                  ),
                                  Text(
                                    'Login with email',
                                    style: kBodyText3,
                                  ),
                                  Divider(
                                    height: 30,
                                    color: kPrimaryColor.withOpacity(0.5),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Form(
                                      key: _loginKey,
                                      child: Column(
                                        children: [
                                          MyTextFormField(
                                            controller: _usernameControler,
                                            hint: 'Username',
                                            icon: Icons.email_outlined,
                                            fillColor: kScaffoldBackground,
                                            inputType: TextInputType.name,
                                            inputAction: TextInputAction.next,
                                            focusNode: _loginFocusNodes[0],
                                            validator: usernameValidator,
                                          ),
                                          MyPasswordField(
                                            controller: _passwordController,
                                            fillColor: kScaffoldBackground,
                                            focusNode: _loginFocusNodes[1],
                                            validator: passwordValidator,
                                          ),
                                          MyTextButton(
                                            buttonName: 'Login',
                                            onPressed: onSubmit,
                                            bgColor: kPrimaryColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  // ForgotPasswordPage()
                                                  SignUpPage()));
                                    },
                                    child: Text(
                                      'Forgot Password?',
                                      style: kBodyText3.copyWith(
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Don't have an account? "),
                                      SmallTextButton(
                                        buttonText: 'Sign up',
                                        page: SignUpPage(),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
