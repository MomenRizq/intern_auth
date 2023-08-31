import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intern_auth/Auth_view/login_view.dart';
import 'package:intern_auth/Auth_view/widgets/custom_button_widget.dart';
import 'package:intern_auth/Auth_view/widgets/custom_text_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);


  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  String? _name;

  String? _email;

  String? _password;

  bool _isSecure = false;

  bool rememberMe = false;

  void _submitFormOnRegister() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
       _formKey.currentState!.save();
       print("${_email} + ${_name} , +${_password} ") ;
      // Navigator.pushNamed(context, VerficationCodeView.routeName);
    }
  }

  void _onRememberMeChanged(bool? newValue) => setState(() {
    rememberMe = newValue!;

  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
            key: _formKey,
            child: Column(
              children: [
                CustomFormTextField(
                  label: 'Username',
                  onchanged: (name) {
                    _name = name;
                  },
                  emptyText: 'Please ,Enter valid Username',
                  suffixIcon: Icons.cancel_outlined,
                ),
                CustomFormTextField(
                  label: 'Email',
                  onchanged: (email) {
                    _email = email;
                  },
                  emptyText: 'Please ,Enter valid Email',
                  suffixIcon: Icons.cancel_outlined,
                ),
                CustomFormTextField(
                  label: 'Password',
                  obscureText: true,
                  onchanged: (pss) {
                    _password = pss;
                  },
                  emptyText: 'Please ,Enter valid Password',
                  suffixIcon:
                  _isSecure ? Icons.visibility_off : Icons.visibility,
                ),
              ],
            )),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0 , vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
                width: 15,
                child: Checkbox(
                  checkColor: Colors.black,
                  activeColor:Colors.white.withOpacity(0) ,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                  ),
                  value: rememberMe,
                  onChanged: _onRememberMeChanged,
                ),
              ),
              const SizedBox(width: 8,),
              const Text("Remember me" ,style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w800),),
              const Spacer(),
              GestureDetector(
                child: const Text("Have a problem?" ,style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w800),),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 8),
          child: CustomButtonWidget(buttonText: 'Register',fun: (){
            _submitFormOnRegister();
          },),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 8),
          child: RichText(
              text: TextSpan(
                  text: 'Already have an account? ',
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  children: [
                    TextSpan(
                        text: 'Login',
                        style:  const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginView()));
                        }),
                  ])),
        ),
      ],
    );
  }
}
