import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_auth/Auth_view/cubit/login_cubit/login_cubit.dart';
import 'package:intern_auth/Auth_view/login_view.dart';
import 'package:intern_auth/Auth_view/models/user_model.dart';
import 'package:intern_auth/Auth_view/widgets/custom_button_widget.dart';
import 'package:intern_auth/Auth_view/widgets/custom_text_field.dart';
import 'package:intern_auth/services/remote/dio_helper.dart';

class LoginForm extends StatelessWidget {

   String name = "";

   String password = "";

  @override
  Widget build(BuildContext context) {


    bool _isSecure = false;


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
            key:  BlocProvider.of<LoginCubit>(context).formKey,
            child: Column(
              children: [
                CustomFormTextField(
                  label: 'Username',
                  onchanged: (n) {
                    name = n;
                  },
                  emptyText: 'Please ,Enter valid Username',
                  suffixIcon: Icons.cancel_outlined,
                ),
                CustomFormTextField(
                  label: 'Password',
                  obscureText: true,
                  onchanged: (pss) {
                    password = pss;
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
                  value:  BlocProvider.of<LoginCubit>(context).rememberMe,
                  onChanged: (v){ BlocProvider.of<LoginCubit>(context).onRememberMeChanged(v);},
                ),
              ),
              const SizedBox(width: 8,),
              const Text("Remember me" ,style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w800),),
              const Spacer(),
              GestureDetector(
                child: const Text("Forgot Password?" ,style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w800),),
              )
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 8),
          child: CustomButtonWidget(buttonText: 'Login',fun: (){
            BlocProvider.of<LoginCubit>(context).submitFormOnLogin(username: name!, pass: password!);
          },),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 8),
          child: RichText(
              text: TextSpan(
                  text: 'Don\'t have an account? ',
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  children: [
                    TextSpan(
                        text: 'Register',
                        style:  const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          Navigator.of(context).pop();
                        }),
                  ])),
        ),
      ],
    );
  }
}
