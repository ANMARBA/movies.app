import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/bloc/authentification/authentification.dart';
import 'package:movies_app/views/welcome/pages/welcome_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthentificationState>(
      listener: (context, state) {
        if (state is AuthenticationUnauthenticated) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const WelcomePage()),
              (route) => false);
        }
      },
      child: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(title),
        shadowColor: Colors.white,
        backgroundColor: Colors.transparent,
        toolbarHeight: 70.0,
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 20.0),
            onPressed: () =>
                context.read<AuthenticationBloc>().add(LoggedOut()),
            icon: const Icon(Icons.settings_outlined),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}
