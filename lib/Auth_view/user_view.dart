import 'package:flutter/material.dart';
import 'package:intern_auth/Auth_view/widgets/user_body.dart';

class UserView extends StatelessWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UserBody(),
    );
  }
}
