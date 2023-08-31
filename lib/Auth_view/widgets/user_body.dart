import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_auth/Auth_view/cubit/login_cubit/login_cubit.dart';
import 'package:intern_auth/Auth_view/widgets/custom_button_widget.dart';
import 'package:intern_auth/Auth_view/widgets/custom_text_field.dart';
import 'package:intern_auth/Auth_view/widgets/header_user_widget.dart';
import 'package:intern_auth/Auth_view/widgets/register_form.dart';
import 'package:intern_auth/Auth_view/widgets/user_details.dart';

class UserBody extends StatelessWidget {
  const UserBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context , state) {
        },
        builder: (context , state){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderUserWidget(),
              UserDetails(),

            ],
          );
        },
      ),
    );
  }
}
