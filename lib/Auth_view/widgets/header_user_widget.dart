import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_auth/Auth_view/cubit/login_cubit/login_cubit.dart';

class HeaderUserWidget extends StatelessWidget {
  const HeaderUserWidget();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .35,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.asset("assets/background.png"),
        ),
        Positioned(
            top: 132,
            left: MediaQuery.of(context).size.width * 0.35,
            child: Container(
              width: 115,
              height: 115,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.network(
                "${BlocProvider.of<LoginCubit>(context).userModel.image}",
                fit: BoxFit.fill,
                width: 115,
                height: 115,
              ),
            ))
      ],
    );
  }
}