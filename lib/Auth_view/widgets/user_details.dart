import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_auth/Auth_view/cubit/login_cubit/login_cubit.dart';
import 'package:intern_auth/Auth_view/login_view.dart';
import 'package:intern_auth/Auth_view/widgets/custom_button_widget.dart';
import 'package:intern_auth/Auth_view/widgets/custom_text_field.dart';

class UserDetails extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  bool _isSecure = false;

  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
           ("${BlocProvider.of<LoginCubit>(context).userModel.firstName}"),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
        ),
        Form(
            key: _formKey,
            child: Column(
              children: [
                CustomFormTextField(
                  initText:BlocProvider.of<LoginCubit>(context).userModel.username ,
                  label: 'Username',
                  onchanged: (name) {
                    BlocProvider.of<LoginCubit>(context).userModel.username = name;
                  },
                  emptyText: 'Please ,Enter valid Username',
                  suffixIcon: Icons.cancel_outlined,
                  readOnly: true,
                ),
                CustomFormTextField(
                  initText: BlocProvider.of<LoginCubit>(context).userModel.email ,
                  label: 'Email',
                  onchanged: (email) {
                    BlocProvider.of<LoginCubit>(context).userModel.email = email;
                  },
                  emptyText: 'Please ,Enter valid Email',
                  suffixIcon: Icons.cancel_outlined,
                  readOnly: true,
                ),
                CustomFormTextField(
                  initText: BlocProvider.of<LoginCubit>(context).userModel.gender,
                  label: 'Gender',
                  onchanged: (gender) {
                    BlocProvider.of<LoginCubit>(context).userModel.gender = gender;
                  },
                  emptyText: '',
                  readOnly: true,
                  suffixIcon:
                      _isSecure ? Icons.visibility_off : Icons.visibility,
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          child: CustomButtonWidget(
            buttonText: 'Logout',
            fun: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginView()));
              BlocProvider.of<LoginCubit>(context).userModel == " ";
            },
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
