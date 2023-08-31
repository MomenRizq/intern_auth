import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intern_auth/Auth_view/widgets/custom_button_widget.dart';
import 'package:intern_auth/Auth_view/widgets/custom_text_field.dart';
import 'package:intern_auth/Auth_view/widgets/header_auth_widget.dart';
import 'package:intern_auth/Auth_view/widgets/register_form.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          HeaderAuthWidget(),
          Center(
            child: Text(
              "Create new account",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
          ),
          RegisterForm(),

        ],
      ),
    );
  }
}
