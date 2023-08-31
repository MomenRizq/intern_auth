import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_auth/Auth_view/cubit/login_cubit/login_cubit.dart';
import 'package:intern_auth/Auth_view/login_view.dart';
import 'package:intern_auth/Auth_view/user_view.dart';
import 'package:intern_auth/Auth_view/widgets/custom_button_widget.dart';
import 'package:intern_auth/Auth_view/widgets/custom_text_field.dart';
import 'package:intern_auth/Auth_view/widgets/header_auth_widget.dart';
import 'package:intern_auth/Auth_view/widgets/loading_manager.dart';
import 'package:intern_auth/Auth_view/widgets/login_form.dart';
import 'package:intern_auth/helpr/showSnackBar.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    bool isLoading = false;
    return BlocConsumer<LoginCubit, LoginState>(
        listener: (context , state){
          if (state is LoginLoading)
            isLoading = true;
          else if (state is LoginSuccess)
          {
            // BlocProvider.of<LoginCubit>(context).getMessage();
            showSnackBar(context,
                mesaage: "Success", color: Colors.green);
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                UserView()), (Route<dynamic> route) => false);
            isLoading = false;
          }
          else if (state is LoginFailure)
          {
            showSnackBar(context,
                mesaage: state.errorMeassage, color: Colors.red);
            isLoading = false;
          }
        },
      builder: (context, snapshot) {
        return LoadingManager(
          isLoading: BlocProvider.of<LoginCubit>(context).isLoading,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                const HeaderAuthWidget(),
                const Center(
                  child: Text(
                    "Log in to your account",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                ),
                LoginForm(),

              ],
            ),
          ),
        );
      }
    );
  }
}
